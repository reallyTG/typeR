library(keyring)


### Name: backend_wincred
### Title: Create a Windows Credential Store keyring backend
### Aliases: backend_wincred
### Keywords: datasets

### ** Examples

## Not run: 
##D ## This only works on Windows
##D kb <- backend_wincred$new()
##D kb$create_keyring("foobar")
##D kb$set_default_keyring("foobar")
##D kb$set_with_value("service", password = "secret")
##D kb$get("service")
##D kb$delete("service")
##D kb$delete_keyring("foobar")
## End(Not run)



