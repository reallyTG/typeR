library(argon2)


### Name: hashing
### Title: Password Hashing
### Aliases: hashing pw_hash pw_check

### ** Examples

## Not run: 
##D library(argon2)
##D 
##D pass <- "myPassw0rd!"
##D hash <- pw_hash(pass)
##D hash # store this
##D 
##D pw_check(hash, pass)
##D pw_check(hash, "password")
##D pw_check(hash, "1234")
## End(Not run)




