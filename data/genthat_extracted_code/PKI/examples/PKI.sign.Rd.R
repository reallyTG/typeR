library(PKI)


### Name: PKI.sign
### Title: PKI: sign content or verify a signature
### Aliases: PKI.sign PKI.verify
### Keywords: manip

### ** Examples

  key <- PKI.genRSAkey(2048)
  x <- charToRaw("My message to sign")
  sig <- PKI.sign(x, key)
  stopifnot(PKI.verify(x, sig, key))



