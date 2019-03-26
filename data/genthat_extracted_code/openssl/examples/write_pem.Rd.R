library(openssl)


### Name: write_pem
### Title: Export key or certificate
### Aliases: write_pem write_der write_pkcs1 write_ssh

### ** Examples

# Generate RSA keypair
key <- rsa_keygen()
pubkey <- key$pubkey

# Write to output formats
write_ssh(pubkey)
write_pem(pubkey)
write_pem(key, password = "super secret")



