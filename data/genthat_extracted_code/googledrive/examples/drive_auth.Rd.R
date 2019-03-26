library(googledrive)


### Name: drive_auth
### Title: Authorize googledrive
### Aliases: drive_auth

### ** Examples

## Not run: 
##D ## load/refresh existing credentials, if available
##D ## otherwise, go to browser for authentication and authorization
##D drive_auth()
##D 
##D ## force a new oauth token to be obtained
##D drive_auth(reset = TRUE)
##D 
##D ## store token in an object and then to file
##D ttt <- drive_auth()
##D saveRDS(ttt, "ttt.rds")
##D 
##D ## load a pre-existing token
##D drive_auth("ttt.rds") # from .rds file
##D 
##D ## use a service account token
##D drive_auth(service_token = "foofy-83ee9e7c9c48.json")
## End(Not run)



