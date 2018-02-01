class GossipsController < ApplicationController
	def index
		@gossips = Gossip.all
	end

	def new
		@gossips = Gossip.new
	end

	def create
		Gossip.create(gossip_params)
		redirect_to gossips_path
	end

	def destroy
		@gossips = Gossip.find(params[:id])
		@gossips.destroy
		redirect_to gossips_path
	end

	def show
		@gossips = Gossip.find(params[:id])
	end

	def edit
		@gossips = Gossip.find(params[:id])
	end

	def update
		@gossips = Gossip.find(params[:id])
		param = params.require(:gossip).permit(:anonymous_author, :content)
		@gossips.update(param)
		redirect_to gossips_path
	end

	private

	def gossip_params
		params.require(:gossip).permit(:anonymous_author, :content)
	end
end
