library(keyring)


### Name: backend_env
### Title: Store secrets in environment variables
### Aliases: backend_env
### Keywords: datasets

### ** Examples

## Not run: 
##D env <- backend_env$new()
##D env$set("r-keyring-test", username = "donaldduck")
##D env$get("r-keyring-test", username = "donaldduck")
##D Sys.getenv("r-keyring-test:donaldduck")
##D 
##D # This is an error
##D env$list()
##D 
##D # Clean up
##D env$delete("r-keyring-test", username = "donaldduck")
## End(Not run)



