library(nimble)


### Name: runMCMC
### Title: Run one or more chains of an MCMC algorithm and return samples,
###   summary and/or WAIC
### Aliases: runMCMC

### ** Examples

## Not run: 
##D code <- nimbleCode({
##D     mu ~ dnorm(0, sd = 1000)
##D     sigma ~ dunif(0, 1000)
##D     for(i in 1:10) {
##D         x[i] ~ dnorm(mu, sd = sigma)
##D     }
##D })
##D Rmodel <- nimbleModel(code)
##D Rmodel$setData(list(x = c(2, 5, 3, 4, 1, 0, 1, 3, 5, 3)))
##D Rmcmc <- buildMCMC(Rmodel)
##D Cmodel <- compileNimble(Rmodel)
##D Cmcmc <- compileNimble(Rmcmc, project = Rmodel)
##D inits <- function() list(mu = rnorm(1,0,1), sigma = runif(1,0,10))
##D samplesList <- runMCMC(Cmcmc, niter = 10000, nchains = 3, inits = inits)
## End(Not run)




