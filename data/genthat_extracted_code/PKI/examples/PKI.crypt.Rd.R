library(PKI)


### Name: PKI.crypt
### Title: PKI encryption/decryption functions
### Aliases: PKI.crypt PKI.encrypt PKI.decrypt
### Keywords: manip

### ** Examples

  key <- PKI.genRSAkey(2048)
  x <- charToRaw("Hello, world!")
  e <- PKI.encrypt(x, key)
  y <- PKI.decrypt(e, key)
  stopifnot(identical(x, y))
  print(rawToChar(y))

  ## AES symmetric - use SHA256 to support arbitrarily long key strings
  key <- PKI.digest(charToRaw("hello"), "SHA256")
  ae <- PKI.encrypt(x, key, "aes256")
  ae
  ad <- PKI.decrypt(ae, key, "aes256")
  stopifnot(identical(x, ad))



