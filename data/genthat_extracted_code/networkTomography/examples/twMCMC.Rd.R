library(networkTomography)


### Name: twMCMC
### Title: Function to run MCMC sampling for model of Tebaldi & West (1998)
### Aliases: twMCMC
### Keywords: models multivariate

### ** Examples

data(bell.labs)
# Quick, simple run to test the function
prior <- list(a=rep(1, ncol(bell.labs$A)), b=rep(0, ncol(bell.labs$A)))
mcmcOut <- twMCMC(Y=bell.labs$Y[1,], A=bell.labs$A, prior=prior,
                  ndraws=1000, burnin=100,
                  verbose=0)
print(summary(mcmcOut$XDraws))
print(mcmcOut$accepts)



