defmodule Platform.Products.Gameplay do
	use Ecto.Schema
	import Ecto.Changeset

	alias Platform.Accounts.Player
	alias Platform.Products.Game
	alias Platform.Products.Gameplay

	schema "gameplays" do
		belongs_to :games, Game
		belongs_to :players, Player

		field :player_score, :integer, default: 0
	end

	@doc false
	def changeset(%Gameplay{} = gameplay, attrs) do
		gameplay
			|> cast(attrs, [:game_id, :player_id, :player_score])
			|> validate_required([:game_id, :player_id, :player_score])
	end
end