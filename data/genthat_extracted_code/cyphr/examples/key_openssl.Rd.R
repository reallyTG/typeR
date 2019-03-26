library(cyphr)


### Name: key_openssl
### Title: Symmetric encryption with openssl
### Aliases: key_openssl

### ** Examples

# Create a new key
key <- cyphr::key_openssl(openssl::aes_keygen())
key

# With this key encrypt a string
secret <- cyphr::encrypt_string("my secret string", key)
# And decrypt it again:
cyphr::decrypt_string(secret, key)



