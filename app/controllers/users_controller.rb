class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @books= @user.books
    @book= Book.new
     @user =current_user
  end
  def index
    @users = User.all
    @book= Book.new
    @user =current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
  if  @user.update(user_params)
    flash[:notice]= "You have updated user successfully."
    redirect_to users_path(@user.id)
  else
      render :edit
  end  
  end
def create
     @user = User.new(name: params[:user][:name], password: params[:user][:password])
  if   @user.save
    redirect_to root_path, success: 'Welcome! You have signed up successfully.'
  else
    render :new
  end
end
 private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
