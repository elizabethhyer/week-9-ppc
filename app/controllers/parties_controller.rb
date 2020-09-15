class PartiesController < ApplicationController
  def index
      @parties = Party.all
  end

  def show
      @party = Party.find(params[:id])
  end

  def new
    @party = Party.new
  end 

  def create 
    @party = Party.new(party_params(:name, :date, :budget)) 
    if @party.valid?
      @party.save
      redirect_to party_path(@party)
    else 
      render :new 
    end 
  end 

  private 

  def party_params(*args)
    params.require(:party).permit(args) 
  end 
end
