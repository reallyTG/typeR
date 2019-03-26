library(keyring)


### Name: key_get
### Title: Query, set, delete list keys in a keyring
### Aliases: key_get key_get_raw key_set key_set_with_value
###   key_set_with_raw_value key_delete key_list

### ** Examples

# These examples use the default keyring, and they are interactive,
# so, we don't run them by default
## Not run: 
##D key_set("R-keyring-test-service", "donaldduck")
##D key_get("R-keyring-test-service", "donaldduck")
##D if (has_keyring_support()) key_list(service = "R-keyring-test-service")
##D key_delete("R-keyring-test-service", "donaldduck")
##D 
##D ## This is non-interactive, assuming that that default keyring
##D ## is unlocked
##D key_set_with_value("R-keyring-test-service", "donaldduck",
##D                    password = "secret")
##D key_get("R-keyring-test-service", "donaldduck")
##D if (has_keyring_support()) key_list(service = "R-keyring-test-service")
##D key_delete("R-keyring-test-service", "donaldduck")
## End(Not run)



