library(sodium)


### Name: Stream ciphers
### Title: Stream Ciphers
### Aliases: 'Stream ciphers' chacha20 stream salsa20 xsalsa20

### ** Examples

# Very basic encryption
myfile <- file.path(R.home(), "COPYING")
message <- readBin(myfile, raw(), file.info(myfile)$size)
passwd <- charToRaw("My secret passphrase")

# Encrypt:
key <- hash(passwd)
nonce8 <- random(8)
stream <- chacha20(length(message), key, nonce8)
ciphertext <- base::xor(stream, message)

# Decrypt:
stream <- chacha20(length(ciphertext), key, nonce8)
out <- base::xor(ciphertext, stream)
stopifnot(identical(out, message))

# Other stream ciphers
stream <- salsa20(10000, key, nonce8)
stream <- xsalsa20(10000, key, random(24))




