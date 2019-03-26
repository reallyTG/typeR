library(instaR)


### Name: instaOAuth
### Title: Create OAuth token to Intagram R session
### Aliases: instaOAuth

### ** Examples

## Not run: 
##D ## an example of an authenticated request after creating the OAuth token
##D ## where app_id and app_secret are fictitious, and token is saved for
##D ## future sessions
##D  my_oauth <- instaOAuth(app_id="123456789", app_secret="1A2B3C4D")
##D  save(my_oauth, file="my_oauth")
##D  load("my_oauth")
##D  obama <- searchInstagram(tag="obama", token=my_oauth)
## End(Not run)




