library(wosr)


### Name: auth
### Title: Authenticate user credentials
### Aliases: auth

### ** Examples

## Not run: 
##D 
##D # Pass user credentials in manually:
##D auth("some_username", password = "some_password")
##D 
##D # Use the default of looking for username and password in envvars, so you
##D # don't have to keep specifying them in your code:
##D Sys.setenv(WOS_USERNAME = "some_username", WOS_PASSWORD = "some_password")
##D auth()
## End(Not run)



