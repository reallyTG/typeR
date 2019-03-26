library(tumblR)


### Name: posts.submission
### Title: Retrieve Submission Posts.
### Aliases: posts.submission
### Keywords: posts submission

### ** Examples

## Not run: 
##D 	
##D ## An example of an authenticated request using the httr package,
##D ## where consumer_key, consumer_secret, appname are fictitious.
##D ## You can obtain your own at https://www.tumblr.com/oauth/apps
##D 
##D consumer_key <-'key'
##D consumer_secret <- 'secret'
##D appname <- Tumblr_App
##D tokenURL <- 'http://www.tumblr.com/oauth/request_token'
##D accessTokenURL <- 'http://www.tumblr.com/oauth/access_token'
##D authorizeURL <- 'http://www.tumblr.com/oauth/authorize'
##D 
##D app <- oauth_app(appname, consumer_key, consumer_secret)
##D endpoint <- oauth_endpoint(tokenURL, authorizeURL, accessTokenURL)
##D token <- oauth1.0_token(endpoint, app)
##D sig <- sign_oauth1.0(app, 
##D token = token$credentials$oauth_token, 
##D token_secret = token$credentials$oauth_token_secret)
##D 
##D ## you must specify a real blog for base_hostname					
##D base_hostname <- base_hostname					
##D 					
##D posts.submission(base_hostname = base_hostname, filter = "HTML", token = token, 
##D consumer_key = consumer_key, consumer_secret = consumer_secret)
## End(Not run)				



