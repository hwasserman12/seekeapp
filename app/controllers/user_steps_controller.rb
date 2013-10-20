class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal, :social
  
  def show
    @user = current_user
    render_wizard
  
 end

        def update
    @user = current_user
    case step
    when :personal
            @user.update_attributes(params[:user])
    end
    sign_in(@user, :bypass => true)
    render_wizard @user
  end

end
