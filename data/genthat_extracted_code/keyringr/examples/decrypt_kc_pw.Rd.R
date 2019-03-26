library(keyringr)


### Name: decrypt_kc_pw
### Title: Get a generic password from macOS Keychain using the 'security'
###   cli
### Aliases: decrypt_kc_pw

### ** Examples

## Not run: 
##D # First store a password in Keychain
##D # now return the password above to the R environment
##D x <- decrypt_kc_pw("label")
##D 
##D # function is best used in a connection string command:
##D ch <- odbcConnect("some dsn", uid = "user1", pwd = decrypt_kc_pw("mydb_myuser"))
## End(Not run)



