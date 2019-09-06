class SightingsController < ApplicationController
  def index
    @sightings = Sighting.all
      render json: @sightings
  end

  def show
    @sightings = Sighting.find(params[:id])
    render json: @sightings
  end

  def create
    @sightings = Sighting.new(sightings_params)
    if @sightings.save
      render json: @sightings, status:201
    else
      render json: @sightings.errors, status:422
    end
  end

  def sightings_params
    params.require(:sightings).permit(:name, :latin_name, :kingdom)
  end

  def destroy
    @sightings = Sighting.find(params[:id])
    if @sightings.destroy
      render json: @sightings, status: 200
    else
      render json: {errors: 'Could not destroy the sightings'}, status: 400
    end
  end

  def update
    @sightings = Sighting.find(params[:id])
    if @sightings.update(sightings_params)
      render json: @sightings
    else
      render json: {errors: 'Could not update the sightings'}
    end
  end
end
