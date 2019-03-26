library(openssl)


### Name: keygen
### Title: Generate Key pair
### Aliases: keygen rsa_keygen dsa_keygen ec_keygen

### ** Examples

# Generate keypair
key <- rsa_keygen()
pubkey <- as.list(key)$pubkey

# Write/read the key with a passphrase
write_pem(key, "id_rsa", password = "supersecret")
read_key("id_rsa", password = "supersecret")



