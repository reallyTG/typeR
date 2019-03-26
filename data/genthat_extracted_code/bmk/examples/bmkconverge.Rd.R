library(bmk)


### Name: bmkconverge
### Title: bmkcoverge: Convergence via the Hellinger distance
### Aliases: bmkconverge

### ** Examples

## Not run: 
##D library(dismo); library(MCMCpack);
##D data(Anguilla_train)
##D b0mean <- 0
##D b0precision <- (1/5)^2
##D mcmclen = 1000
##D burn=10000
##D MCMC.one <- MCMClogit(Angaus ~ SegSumT+DSDist+USNative+as.factor(Method)+DSMaxSlope+USSlope,
##D                 data=Anguilla_train,burnin=burn, mcmc=mcmclen, beta.start=-1,
##D                 b0=b0mean, B0=b0precision)
##D  
## End(Not run)
 data(MCMCsamples)
 mcmclen <- 1000
 bmkconverge(MCMC.one,mcmclen/10)



