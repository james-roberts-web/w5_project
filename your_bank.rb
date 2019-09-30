require('sinatra')
require('sinatra/reloader')
require_relative('./models/category.rb')
require_relative('./models/merchant.rb')
require_relative('./models/transaction.rb')
require_relative('./models/user.rb')
also_reload('../models/*')

get '/' do
  erb(:index)
end

#TRANSACTIONS

# get '/transactions/index' do
#   @transaction = Transaction.all
#   erb(:"transactions/index")
# end

get '/transactions' do
  @transactions = Transaction.all
  erb(:"transactions/index")
end

get '/transactions/new' do
  @transaction = Transaction.all
  erb(:"transactions/new")
end

get '/transactions/index/:id' do
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/index")
end

post '/transactions/index' do
  Transaction.new(params).save
  redirect'/transactions/index'
end

#MERCHANTS

get '/merchants' do
  @merchants = Merchant.all
  erb(:"merchants/index")
end

get '/merchants/new' do
  @merchants = Merchant.all
  erb(:"/merchants/new")
end

post '/merchants' do
  Merchant.new(params).save
  redirect'/merchants'
end

get '/merchants/:id' do
  @merchants = Merchant.find(params[:id])
  erb(:"/merchants/index")
end

get '/merchants/:id/edit' do
  @merchants = Merchant.find(params[:id])
  erb(:"/merchants/edit")
end

put '/merchants/:id' do
  Merchant.new(params).update
  redirect '/merchants'
end

delete '/merchants/:id' do
  destructed = Merchant.find(params[:id])
  destructed.delete
  redirect '/merchants'
end


#CATEGORIES

get '/categories' do
  @categories = Category.all
  erb(:"categories/index")
end

get '/categories/new' do
  @categories = Category.all
  erb(:"/categories/new")
end

post '/categories' do
  Category.new(params).save
  redirect'/categories'
end

get '/categories/:id' do
  @categories = Category.find(params[:id])
  erb(:"/categories/index")
end

get '/categories/:id/edit' do
  @categories = Category.find(params[:id])
  erb(:"/categories/edit")
end

put '/categories/:id' do
  Category.new(params).update
  redirect '/categories'
end

delete '/categories/:id' do
  destructed = Category.find(params[:id])
  destructed.delete
  redirect '/categories'
end


#USERS

get '/users' do
  @users = User.all
  erb(:"/users/index")
end
