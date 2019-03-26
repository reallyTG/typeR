library(sodium)


### Name: Key generation
### Title: Keypair Generation
### Aliases: 'Key generation' keygen pubkey

### ** Examples

# Create keypair
key <- keygen()
pub <- pubkey(key)

# Basic encryption
msg <- serialize(iris, NULL)
ciphertext <- simple_encrypt(msg, pub)
out <- simple_decrypt(ciphertext, key)
stopifnot(identical(msg, out))



