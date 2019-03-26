library(sodium)


### Name: Hash functions
### Title: Hash Functions
### Aliases: 'Hash functions' hash hashing scrypt shorthash sha512 sha256

### ** Examples

# Basic hashing
msg <- serialize(iris, NULL)
hash(msg)
sha256(msg)
sha512(msg)
scrypt(msg)

# Generate keys from passphrase
passphrase <- charToRaw("This is super secret")
key <- hash(passphrase)
shortkey <- hash(passphrase, size = 16)
longkey <- hash(passphrase, size = 64)

# HMAC (hashing with key)
hash(msg, key = key)
shorthash(msg, shortkey)
sha256(msg, key = key)
sha512(msg, key = longkey)



