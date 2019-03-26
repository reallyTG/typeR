library(keyring)


### Name: backend_macos
### Title: Create a macOS Keychain backend
### Aliases: backend_macos
### Keywords: datasets

### ** Examples

## Not run: 
##D ## This only works on macOS
##D kb <- backend_macos$new()
##D kb$create_keyring("foobar")
##D kb$set_default_keyring("foobar")
##D kb$set_with_value("service", password = "secret")
##D kb$get("service")
##D kb$delete("service")
##D kb$delete_keyring("foobar")
## End(Not run)



