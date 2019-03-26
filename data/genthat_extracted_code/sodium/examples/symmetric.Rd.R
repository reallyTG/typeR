library(sodium)


### Name: Symmetric encryption
### Title: Symmetric Encryption and Tagging
### Aliases: 'Symmetric encryption' data_encrypt data_decrypt data_tag

### ** Examples

# 256-bit key
key <- sha256(charToRaw("This is a secret passphrase"))
msg <- serialize(iris, NULL)

# Encrypts with random nonce
cipher <- data_encrypt(msg, key)
orig <- data_decrypt(cipher, key)
stopifnot(identical(msg, orig))

# Tag the message with your key (HMAC)
tag <- data_tag(msg, key)



