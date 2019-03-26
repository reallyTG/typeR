library(Rfacebook)


### Name: fbOAuth
### Title: Create OAuth token to Facebook R session
### Aliases: fbOAuth

### ** Examples

## Not run: 
##D ## an example of an authenticated request after creating the OAuth token
##D ## where app_id and app_secret are fictitious, and token is saved for
##D ## future sessions
##D fb_oauth <- fbOAuth(app_id="123456789", app_secret="1A2B3C4D")
##D save(fb_oauth, file="fb_oauth")
##D load("fb_oauth")
##D me <- getUsers("me", token=fb_oauth)
##D me$username
##D 
##D ## an example of a request using a temporary access token
##D 	token <- "XXXXXXAAAAAAA1111"
##D 	me <- getUsers("me", token=token)
## End(Not run)




