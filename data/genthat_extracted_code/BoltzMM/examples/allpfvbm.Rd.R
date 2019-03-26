library(BoltzMM)


### Name: allpfvbm
### Title: Probability mass function of a fully-visible Boltzmann machine
###   evaluated for all possible vectors.
### Aliases: allpfvbm

### ** Examples

# Compute the probability of every length n=3 binary spin vector under bvec and Mmat.
bvec <- c(0,0.5,0.25)
Mmat <- matrix(0.1,3,3) - diag(0.1,3,3)
allpfvbm(bvec,Mmat)



