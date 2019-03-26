library(BAMBI)


### Name: bridge_sampler.angmcmc
### Title: Log Marginal Likelihood via Bridge Sampling for angmcmc objects
### Aliases: bridge_sampler.angmcmc

### ** Examples

## Not run: 
##D library(future)
##D library(parallel)
##D plan(multiprocess)
##D 
##D set.seed(100)
##D MC.fit <- fit_angmix("vmsin", tim8, ncomp=3, n.iter=500,
##D                      n.chains = 3)
##D 
##D library(bridgesampling)
##D bridge_sampler(MC.fit)
## End(Not run)




