library(rdrop2)


### Name: drop_auth
### Title: Authentication for Dropbox
### Aliases: drop_auth

### ** Examples

## Not run: 
##D 
##D   # To either read token from .httr-oauth in the working directory or open a
##D   # web browser to authenticate (and cache a token)
##D   drop_auth()
##D 
##D   # If you want to overwrite an existing local token and switch to a new
##D   # user, set new_user to TRUE.
##D   drop_auth(new_user = TRUE)
##D 
##D   # To store a token for re-use (more flexible than .httr-oauth), save the
##D   # output of drop_auth and save it to an RDS file
##D   token <- drop_auth()
##D   saveRDS(token, "/path/to/tokenfile.RDS")
##D 
##D   # To use a stored token provide token location
##D   drop_auth(rdstoken = "/path/to/tokenfile.RDS")
## End(Not run)



