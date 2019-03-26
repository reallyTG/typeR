library(bcrypt)


### Name: bcrypt
### Title: Bcrypt password hashing
### Aliases: bcrypt gensalt hashpw checkpw

### ** Examples

# Secret message as a string
passwd <- "supersecret"

# Create the hash
hash <- hashpw(passwd)
hash

# To validate the hash
identical(hash, hashpw(passwd, hash))

# Or use the wrapper
checkpw(passwd, hash)

# Use varying complexity:
hash11 <- hashpw(passwd, gensalt(11))
hash12 <- hashpw(passwd, gensalt(12))
hash13 <- hashpw(passwd, gensalt(13))

# Takes longer to verify (or crack)
system.time(checkpw(passwd, hash11))
system.time(checkpw(passwd, hash12))
system.time(checkpw(passwd, hash13))



