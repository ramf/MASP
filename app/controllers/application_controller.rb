class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
	def configure_permitted_parameters
	# devise 4.3 .for method replaced by .permit
	devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
	#devise_parameter_sanitizer.for(:sign_in) << :username
	end
end
