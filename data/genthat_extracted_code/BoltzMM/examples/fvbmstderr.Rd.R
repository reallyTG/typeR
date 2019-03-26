library(BoltzMM)


### Name: fvbmstderr
### Title: Standard errors for the parameter elements of a fitted
###   fully-visible Boltzmann machine.
### Aliases: fvbmstderr

### ** Examples

# Generate num=1000 random strings of n=3 binary spin variables under bvec and Mmat.
num <- 1000
bvec <- c(0,0.5,0.25)
Mmat <- matrix(0.1,3,3) - diag(0.1,3,3)
data <- rfvbm(num,bvec,Mmat)
# Fit a fully visible Boltzmann machine to data, starting from parameters bvec and Mmat.
model <- fitfvbm(data,bvec,Mmat)
# Compute the sandwich covariance matrix using the data and the model.
covarmat <- fvbmcov(data,model,fvbmHess)
# Compute the standard errors of the parameter elements according to a normal approximation.
fvbmstderr(data,covarmat)



