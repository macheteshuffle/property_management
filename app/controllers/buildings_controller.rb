class BuildingsController < ApplicationController
  def index
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to @building, notice: "Building was saved successfully."
    else
      render action: 'new'
    end
  end

  def show
    @building = Building.find(params[:id])
  end

  private
    def building_params
      params.require(:building).permit(:address, :city, :state, :zip, :description)
    end
end
