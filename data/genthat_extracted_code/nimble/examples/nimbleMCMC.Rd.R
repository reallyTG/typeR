library(nimble)


### Name: nimbleMCMC
### Title: Executes one or more chains of NIMBLE's default MCMC algorithm,
###   for a model specified using BUGS code
### Aliases: nimbleMCMC

### ** Examples


## Not run: 
##D code <- nimbleCode({
##D     mu ~ dnorm(0, sd = 1000)
##D     sigma ~ dunif(0, 1000)
##D     for(i in 1:10) {
##D         x[i] ~ dnorm(mu, sd = sigma)
##D     }
##D })
##D data <- list(x = c(2, 5, 3, 4, 1, 0, 1, 3, 5, 3))
##D inits <- function() list(mu = rnorm(1,0,1), sigma = runif(1,0,10))
##D mcmc.output <- nimbleMCMC(code, data = data, inits = inits,
##D                           monitors = c("mu", "sigma"), thin = 10,
##D                           niter = 20000, nburnin = 1000, nchains = 3,
##D                           summary = TRUE, WAIC = TRUE)
## End(Not run)




