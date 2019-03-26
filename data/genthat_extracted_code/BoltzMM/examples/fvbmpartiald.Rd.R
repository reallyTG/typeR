library(BoltzMM)


### Name: fvbmpartiald
### Title: Partial derivatives of the log-pseudolikelihood function for a
###   fitted fully-visible Boltzmann machine.
### Aliases: fvbmpartiald

### ** Examples

# Generate num=1000 random strings of n=3 binary spin variables under bvec and Mmat.
num <- 1000
bvec <- c(0,0.5,0.25)
Mmat <- matrix(0.1,3,3) - diag(0.1,3,3)
data <- rfvbm(num,bvec,Mmat)
# Fit a fully visible Boltzmann machine to data, starting from parameters bvec and Mmat.
model <- fitfvbm(data,bvec,Mmat)
# Compute the partial derivatives evaluated at the first observation of data.
fvbmpartiald(data,model)



