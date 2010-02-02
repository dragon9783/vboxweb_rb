# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :password_protect
  def password_protect
    authenticate_or_request_with_http_basic do |username, password|
      [username, password] == [APP_CONFIG['username'], APP_CONFIG['password']]
    end
  end
  private :password_protect
end