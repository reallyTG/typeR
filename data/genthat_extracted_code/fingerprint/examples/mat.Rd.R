library(fingerprint)


### Name: fp.to.matrix
### Title: Converts a List of Fingerprints to a Matrix
### Aliases: fp.to.matrix
### Keywords: logic

### ** Examples

# make fingerprint objects
fp1 <- new("fingerprint", nbit=6, bits=c(1,2,5,6))
fp2 <- new("fingerprint", nbit=6, bits=c(1,4,5,6))
fp3 <- new("fingerprint", nbit=6, bits=c(2,3,4,5,6))

fp.to.matrix( list(fp1,fp2,fp3) )



