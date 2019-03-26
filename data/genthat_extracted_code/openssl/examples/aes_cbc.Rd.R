library(openssl)


### Name: aes_cbc
### Title: Symmetric AES encryption
### Aliases: aes_cbc aes_ctr_encrypt aes_ctr_decrypt aes_cbc_encrypt
###   aes_cbc_decrypt aes_gcm_encrypt aes_gcm_decrypt aes_keygen

### ** Examples

# aes-256 requires 32 byte key
passphrase <- charToRaw("This is super secret")
key <- sha256(passphrase)

# symmetric encryption uses same key for decryption
x <- serialize(iris, NULL)
y <- aes_cbc_encrypt(x, key = key)
x2 <- aes_cbc_decrypt(y, key = key)
stopifnot(identical(x, x2))



