class ListingsController < ApplicationController
	def index
		@listings = Listing.all
	end

	def new
		@listing = Listing.new
	end

	def create
		#binding.pry
		@listing = Listing.new(listing_params)
		if @listing.save
			redirect_to listings_path
		else
			render :new
		end
	end
	def edit
		@listing = Listing.find(params[:id])
	end
	def update
		@listing = Listing.find(params[:id])
		if @listing.update(listing_params)
			redirect_to listings_path
		else
			render :edit
		end
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def destroy
		#binding.pry
		@listing = Listing.find(params[:id])
		@listing.destroy
		redirect_to listings_path
	end
	private

	def listing_params
		params.require(:listing).permit(:description)
	end
end