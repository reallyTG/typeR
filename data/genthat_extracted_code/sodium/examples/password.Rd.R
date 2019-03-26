library(sodium)


### Name: Password storage
### Title: Password Storage
### Aliases: 'Password storage' password_store password password_verify

### ** Examples

# Example password
password <- "I like cookies"

# Hash is what you store in the database
hash <- password_store(password)

# To verify the password when the user logs in
stopifnot(password_verify(hash, password))



