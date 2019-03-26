library(fingerprint)


### Name: fp.factor.matrix
### Title: Converts a List of Fingerprints to a data.frame of Factors
### Aliases: fp.factor.matrix
### Keywords: logic

### ** Examples

# make fingerprint objects
fp1 <- new("fingerprint", nbit=6, bits=c(1,2,5,6))
fp2 <- new("fingerprint", nbit=6, bits=c(1,4,5,6))
fp3 <- new("fingerprint", nbit=6, bits=c(2,3,4,5,6))

fp.factor.matrix( list(fp1,fp2,fp3) )



