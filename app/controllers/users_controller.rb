class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params) # Not the final implementation!
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      # same as redirect_to user_url(@user)
      # same as redirect_to users/:id
      # same as redirect_to show
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
    
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
                                             
  
end
