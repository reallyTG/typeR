library(bmk)


### Name: MCMC.one.mean0
### Title: MCMC.one.mean0 is an mcmc object resulting from the following
###   code:
### Aliases: MCMC.one.mean0
### Keywords: data datasets

### ** Examples

## Not run: 
##D  library(dismo); library(MCMCpack)
##D  data(Anguilla_train)
##D  b0mean0 <- 0
##D  b0precision <- (1/5)^2
##D  mcmclen = 50000
##D  burn=200000
##D  MCMC.one.mean0 <- MCMClogit(Angaus ~ SegSumT+DSDist+USNative+as.factor(Method)+DSMaxSlope+USSlope,
##D                   data=Anguilla_train,burnin=burn, mcmc=mcmclen, beta.start=-1,
##D                   b0=b0mean0, B0=b0precision)
##D  
## End(Not run)



