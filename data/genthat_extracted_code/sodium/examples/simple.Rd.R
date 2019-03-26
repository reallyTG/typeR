library(sodium)


### Name: Simple encryption
### Title: Anonymous Public-key Encryption (Sealed Box)
### Aliases: 'Simple encryption' simple_encrypt simple_decrypt

### ** Examples

# Generate keypair
key <- keygen()
pub <- pubkey(key)

# Encrypt message with pubkey
msg <- serialize(iris, NULL)
ciphertext <- simple_encrypt(msg, pub)

# Decrypt message with private key
out <- simple_decrypt(ciphertext, key)
stopifnot(identical(out, msg))



