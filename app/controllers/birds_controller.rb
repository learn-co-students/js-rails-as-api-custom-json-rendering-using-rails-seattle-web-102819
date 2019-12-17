class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # Instead of the above, can also list the items you want to exclude from the render.
    # render json: birds, except: [:created_at, :udpated_at]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
    # render json: {id: bird.id, name: bird.name, species: bird.species}
    # the below works, but only on individual instances. What works on multiple instances ex. index is using only:
      render json: bird.slice(:id, :name, :species)
    else
      render json: {message: 'Bird not found'}
    end
  end
end