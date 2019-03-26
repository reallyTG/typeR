library(BoltzMM)


### Name: pfvbm
### Title: Probability mass function of a fully-visible Boltzmann machine
###   evaluated for an individual vector.
### Aliases: pfvbm

### ** Examples

# Compute the probability of the vector xval=(-1,1,-1), under bvec and Mmat.
xval <- c(-1,1,-1)
bvec <- c(0,0.5,0.25)
Mmat <- matrix(0.1,3,3) - diag(0.1,3,3)
pfvbm(xval,bvec,Mmat)



