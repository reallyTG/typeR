library(pps)


### Name: sampfordpi
### Title: Joint inclusion probabilities for Sampford's PPS sampling method
### Aliases: sampfordpi
### Keywords: survey

### ** Examples

sizes <- c(9,2,5,17,4,21,15,7,4,11,23,23,14)
piij <- sampfordpi(sizes,4)
weights <- 1/diag(piij)  # the weights one would use for estimation



