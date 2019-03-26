library(keyring)


### Name: has_keyring_support
### Title: Manage keyrings
### Aliases: has_keyring_support keyring_create keyring_list keyring_delete
###   keyring_lock keyring_unlock keyring_is_locked

### ** Examples

default_backend()
has_keyring_support()
backend_env$new()$has_keyring_support()

## This might ask for a password, so we do not run it by default
## It only works if the default backend supports multiple keyrings
## Not run: 
##D keyring_create("foobar")
##D key_set_with_value("R-test-service", "donaldduck", password = "secret",
##D                    keyring = "foobar")
##D key_get("R-test-service", "donaldduck", keyring = "foobar")
##D key_list(keyring = "foobar")
##D keyring_delete(keyring = "foobar")
## End(Not run)



