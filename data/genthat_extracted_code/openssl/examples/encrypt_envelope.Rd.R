library(openssl)


### Name: encrypt_envelope
### Title: Envelope encryption
### Aliases: encrypt_envelope envelope decrypt_envelope

### ** Examples

# Requires RSA key
key <- rsa_keygen()
pubkey <- key$pubkey
msg <- serialize(iris, NULL)

# Encrypt
out <- encrypt_envelope(msg, pubkey)
str(out)

# Decrypt
orig <- decrypt_envelope(out$data, out$iv, out$session, key)
stopifnot(identical(msg, orig))



