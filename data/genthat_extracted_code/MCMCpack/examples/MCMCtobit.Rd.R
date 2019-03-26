library(MCMCpack)


### Name: MCMCtobit
### Title: Markov Chain Monte Carlo for Gaussian Linear Regression with a
###   Censored Dependent Variable
### Aliases: MCMCtobit
### Keywords: models

### ** Examples


## Not run: 
##D library(survival)
##D example(tobin)
##D summary(tfit)
##D tfit.mcmc <- MCMCtobit(durable ~ age + quant, data=tobin, mcmc=30000,
##D                         verbose=1000)
##D plot(tfit.mcmc)
##D raftery.diag(tfit.mcmc)
##D summary(tfit.mcmc)
## End(Not run)




