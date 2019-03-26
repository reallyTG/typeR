library(openssl)


### Name: my_key
### Title: Default key
### Aliases: my_key my_pubkey

### ** Examples

# Set random RSA key as default
key <- rsa_keygen()
write_pem(key, tmp <- tempfile(), password = "")
rm(key)
Sys.setenv("USER_KEY" = tmp)

# Check the new keys
print(my_key())
print(my_pubkey())



