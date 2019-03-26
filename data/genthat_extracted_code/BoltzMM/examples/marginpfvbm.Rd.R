library(BoltzMM)


### Name: marginpfvbm
### Title: Marginal probability function for a fully-visible Boltzmann
###   machine.
### Aliases: marginpfvbm

### ** Examples

#Compute the marginal probabilities under bvec and Mmat.
# Set the parameter values
bvec <- c(0,0.5,0.25)
Mmat <- matrix(0.1,3,3) - diag(0.1,3,3)
marginpfvbm(bvec,Mmat)



