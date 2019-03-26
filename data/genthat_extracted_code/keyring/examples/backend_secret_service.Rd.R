library(keyring)


### Name: backend_secret_service
### Title: Create a Secret Service keyring backend
### Aliases: backend_secret_service
### Keywords: datasets

### ** Examples

## Not run: 
##D ## This only works on Linux, typically desktop Linux
##D kb <- backend_secret_service$new()
##D kb$create_keyring("foobar")
##D kb$set_default_keyring("foobar")
##D kb$set_with_value("service", password = "secret")
##D kb$get("service")
##D kb$delete("service")
##D kb$delete_keyring("foobar")
## End(Not run)



