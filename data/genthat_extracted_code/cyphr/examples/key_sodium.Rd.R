library(cyphr)


### Name: key_sodium
### Title: Symmetric encryption with sodium
### Aliases: key_sodium

### ** Examples

# Create a new key
key <- cyphr::key_sodium(sodium::keygen())
key

# With this key encrypt a string
secret <- cyphr::encrypt_string("my secret string", key)
# And decrypt it again:
cyphr::decrypt_string(secret, key)



