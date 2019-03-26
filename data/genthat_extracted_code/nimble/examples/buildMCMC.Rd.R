library(nimble)


### Name: buildMCMC
### Title: Create an MCMC function from a NIMBLE model, or an MCMC
###   configuration object
### Aliases: buildMCMC

### ** Examples

## Not run: 
##D code <- nimbleCode({
##D     mu ~ dnorm(0, 1)
##D     x ~ dnorm(mu, 1)
##D     y ~ dnorm(x, 1)
##D })
##D Rmodel <- nimbleModel(code, data = list(y = 0))
##D conf <- configureMCMC(Rmodel)
##D Rmcmc <- buildMCMC(conf, enableWAIC = TRUE)
##D Cmodel <- compileNimble(Rmodel)
##D Cmcmc <- compileNimble(Rmcmc, project=Rmodel)
##D Cmcmc$run(10000)
##D samples <- as.matrix(Cmcmc$mvSamples)
##D head(samples)
##D WAIC <- Cmcmc$calculateWAIC(nburnin = 1000)
## End(Not run)




