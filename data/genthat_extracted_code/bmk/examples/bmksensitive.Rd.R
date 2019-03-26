library(bmk)


### Name: bmksensitive
### Title: Hellinger distance between two MCMC chains for sensitivity
###   studies
### Aliases: bmksensitive

### ** Examples

data(MCMCsamples)
 bmksensitive(MCMC.one.mean0, MCMC.one.mean1)
 ## Not run: 
##D  library(dismo); library(MCMCpack)
##D  data(Anguilla_train)
##D  b0mean0 <- 0
##D  b0mean1 <- 1
##D  b0precision <- (1/5)^2
##D  mcmclen = 1000
##D  burn=10000
##D  MCMC.one.mean0 <- MCMClogit(Angaus ~ SegSumT+DSDist+USNative+as.factor(Method)+DSMaxSlope+USSlope,
##D                   data=Anguilla_train,burnin=burn, mcmc=mcmclen, beta.start=-1,
##D                   b0=b0mean0, B0=b0precision)
##D  MCMC.one.mean1 <- MCMClogit(Angaus ~ SegSumT+DSDist+USNative+as.factor(Method)+DSMaxSlope+USSlope,
##D                   data=Anguilla_train,burnin=burn, mcmc=mcmclen, beta.start=-.5,
##D                   b0=b0mean1, B0=b0precision)
##D  bmksensitive(one, two)
##D  
## End(Not run)



