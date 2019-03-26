library(ArchaeoPhases)


### Name: coda.mcmc
### Title: Create a 'mcmc.list' object for CODA users.
### Aliases: coda.mcmc
### Keywords: MCMC diagnostic

### ** Examples

    data(Events)
    mcmcList = coda.mcmc(data = Events, numberChains = 3, iterationColumn=1) 
    plot(mcmcList)
    gelman.diag(mcmcList)
    # The multivariate criterion can not be evaluated when a phase 
    # contains only one date. This induces colinearity problems. 
    gelman.diag(mcmcList, multivariate=FALSE)



