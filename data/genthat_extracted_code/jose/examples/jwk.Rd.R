library(jose)


### Name: read_jwk
### Title: JSON web-keys
### Aliases: read_jwk jwk_read jwk write_jwk jwk_write

### ** Examples

# generate an ecdsa key
library(openssl)
key <- ec_keygen("P-521")
write_jwk(key)
write_jwk(as.list(key)$pubkey)

# Same for RSA
key <- rsa_keygen()
write_jwk(key)
write_jwk(as.list(key)$pubkey)



