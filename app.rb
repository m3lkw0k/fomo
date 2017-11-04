require 'sinatra'
require_relative 'models/product.rb'

get '/' do
    @page_title = "Home"
    erb :index
end


get '/team' do
    @page_title = "The Team"
    erb :team
end

get '/products' do
    @page_title = "All Products"
    @products = Product.sample_locations
    erb :product
end

get '/products/location/:location' do
  @page_title = params[:location]
  @products = Product.find_by_location(params[:location])
  erb :category
end

get '/products/:id' do
     @product = Product.find(params[:id])
     @page_title = @product.title
     erb :single
end
