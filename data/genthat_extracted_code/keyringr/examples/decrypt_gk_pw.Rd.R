library(keyringr)


### Name: decrypt_gk_pw
### Title: Get a password from Gnome Keyring using secret-tool
### Aliases: decrypt_gk_pw

### ** Examples

## Not run: 
##D # First encrypt a password using secret-tool as follows:
##D # secret-tool store --label=mylabel db mydb user user1
##D # now return the password above to the R environment
##D x <- decrypt_gk_pw("db mydb user user1")
##D 
##D # function is best used in a connection string command:
##D ch <- odbcConnect("some dsn", uid = "user1", pwd = decrypt_gk_pw("db mydb user user1"))
## End(Not run)



