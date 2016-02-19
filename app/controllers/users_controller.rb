# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UsersController < ApplicationController

	def show
        @user = User.find(params[:id])
	end

    def new
        @user = User.new
    end

	def create
    @user = User.new(users_params)
        if @user.save
            # Save user
            log_in @user
            flash[:success] = 'REGISTER'
            redirect_to @user
        else
	        render 'new'
	    end
	end

	# Define strong params
	private
        # Define private users_params
        def users_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end
