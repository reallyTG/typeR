library(fingerprint)


### Name: distance-methods
### Title: Calculates the Similarity or Dissimilarity Between Two
###   Fingerprints
### Aliases: distance distance-methods
###   distance,featvec,featvec,character,missing,missing-method
###   distance,featvec,featvec,missing,missing,missing-method
###   distance,fingerprint,fingerprint,character,missing,missing-method
###   distance,fingerprint,fingerprint,character,numeric,numeric-method
###   distance,fingerprint,fingerprint,missing,missing,missing-method
### Keywords: logic

### ** Examples

# make a 2 fingerprint vectors
fp1 <- new("fingerprint", nbit=6, bits=c(1,2,5,6))
fp2 <- new("fingerprint", nbit=6, bits=c(1,2,5,6))

# calculate the tanimoto coefficient
distance(fp1,fp2) # should be 1

# Invert the second fingerprint
fp3 <- !fp2

distance(fp1,fp3) # should be 0



