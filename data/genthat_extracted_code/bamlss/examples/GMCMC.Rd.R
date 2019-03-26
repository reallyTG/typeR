library(bamlss)


### Name: GMCMC
### Title: General Markov Chain Monte Carlo for BAMLSS
### Aliases: GMCMC GMCMC_iwls GMCMC_iwlsC GMCMC_iwlsC_gp GMCMC_slice
### Keywords: regression

### ** Examples

## Not run: 
##D ## Simulated data example illustrating
##D ## how to call the sampler function.
##D ## This is done internally within
##D ## the setup of function bamlss().
##D d <- GAMart()
##D f <- num ~ s(x1, bs = "ps")
##D bf <- bamlss.frame(f, data = d, family = "gaussian")
##D 
##D ## First, find starting values with optimizer.
##D opt <- with(bf, bfit(x, y, family))
##D 
##D ## Sample.
##D samps <- with(bf, GMCMC(x, y, family, start = opt$parameters))
##D plot(samps)
## End(Not run)



