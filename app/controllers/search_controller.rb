class SearchController < ApplicationController
  def index
    @locations = Location.all
    @categories = Category.all

    if params[:search] != nil && params[:location_id] != "" 
      like_keyword = "%#{params[:search]}%"
      @trucks = Truck.where("name LIKE ?", like_keyword).where(location_id: params[:location_id])
    elsif params[:search]
      like_keyword = "%#{params[:search]}%"
      @trucks = Truck.where("name LIKE ?", like_keyword)
    elsif params[:location_id]
      @trucks = Truck.where(location_id: params[:location_id])
    else
      @trucks = Truck.all
    end
  end

  def form_params
    params.require(:truck).permit(:search)
  end
end