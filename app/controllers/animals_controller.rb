class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def new
    @animal = Animal.new
  end

  def create
    if Animal.create(animal_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if Animal.destroy(params[:id])
      redirect_to root_path
    end
  end


private

  def animal_params
    return params.require(:animal).permit(:name, :species, :age, :image)
  end



end
