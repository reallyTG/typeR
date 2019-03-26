library(BoltzMM)


### Name: rfvbm
### Title: Random data generation from a fully-visible Boltzmann machine.
### Aliases: rfvbm

### ** Examples

# Generate num=10 random strings of n=3 binary spin variables under bvec and Mmat.
num <- 10
bvec <- c(0,0.5,0.25)
Mmat <- matrix(0.1,3,3) - diag(0.1,3,3)
rfvbm(num,bvec,Mmat)



