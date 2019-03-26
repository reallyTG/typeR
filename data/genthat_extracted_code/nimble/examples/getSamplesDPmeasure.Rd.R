library(nimble)


### Name: getSamplesDPmeasure
### Title: Get posterior samples for a Dirichlet process measure
### Aliases: getSamplesDPmeasure

### ** Examples

## Not run: 
##D   conf <- configureMCMC(model)
##D   Rmcmc <- buildMCMC(conf)
##D   Cmodel <- compileNimble(model)
##D   Cmcmc <- compileNimble(Rmcmc, project = model)
##D   runMCMC(Cmcmc, niter = 1000)
##D   samplesG <- getSamplesDPmeasure(Cmcmc)
## End(Not run)



