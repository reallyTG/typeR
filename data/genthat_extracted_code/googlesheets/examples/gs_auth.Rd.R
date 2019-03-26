library(googlesheets)


### Name: gs_auth
### Title: Authorize 'googlesheets'
### Aliases: gs_auth

### ** Examples

## Not run: 
##D ## load/refresh existing credentials, if available
##D ## otherwise, go to browser for authentication and authorization
##D gs_auth()
##D 
##D ## force a new token to be obtained
##D gs_auth(new_user = TRUE)
##D 
##D ## store token in an object and then to file
##D ttt <- gs_auth()
##D saveRDS(ttt, "ttt.rds")
##D 
##D ## load a pre-existing token
##D gs_auth(token = ttt)       # from an object
##D gs_auth(token = "ttt.rds") # from .rds file
## End(Not run)



