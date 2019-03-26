library(fingerprint)


### Name: fp.sim.matrix
### Title: Calculates a Similarity Matrix for a Set of Fingerprints
### Aliases: fp.sim.matrix
### Keywords: logic

### ** Examples

# make fingerprint objects
fp1 <- new("fingerprint", nbit=6, bits=c(1,2,5,6))
fp2 <- new("fingerprint", nbit=6, bits=c(1,4,5,6))
fp3 <- new("fingerprint", nbit=6, bits=c(2,3,4,5,6))

fp.sim.matrix( list(fp1,fp2,fp3) )



