library(fingerprint)


### Name: euc.vector
### Title: Euclidean Representation of Binary Fingerprints
### Aliases: euc.vector
### Keywords: logic

### ** Examples

# make a fingerprint vector
fp <- new("fingerprint", nbit=8, bits=c(1,3,4,5,7))
vec <- euc.vector(fp)



