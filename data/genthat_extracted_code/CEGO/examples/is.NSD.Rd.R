library(CEGO)


### Name: is.NSD
### Title: Check for Negative Semi-Definiteness
### Aliases: is.NSD

### ** Examples

# The following permutations will produce
# a non-PSD kernel matrix with Insert distance
# and a PSD distance matrix with Hamming distance
# (for the given theta value of 0.01)-
# The respective negative should be (non-) NSD
x <- list(c(2,1,4,3),c(2,4,3,1),c(4,2,1,3),c(4,3,2,1),c(1,4,3,2))
K <- exp(-0.01*distanceMatrix(x,distancePermutationInsert))
is.NSD(-K) 
K <- exp(-0.01*distanceMatrix(x,distancePermutationHamming))
is.NSD(-K)



