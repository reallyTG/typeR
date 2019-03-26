library(AutoDeskR)


### Name: getToken
### Title: Get a 2-Legged Token for Authentication.
### Aliases: getToken

### ** Examples

## Not run: 
##D # Get a 2-legged token with the "data:read" and "data:write" scopes
##D resp <- getToken(id = Sys.getenv("client_id"), secret = Sys.getenv("client_secret"),
##D            scope = "data:write data:read")
##D myToken <- resp$content$access_token
## End(Not run)



