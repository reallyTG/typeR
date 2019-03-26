library(bamlss)


### Name: JAGS
### Title: Markov Chain Monte Carlo for BAMLSS using JAGS
### Aliases: JAGS BUGSeta BUGSmodel
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
##D ## Sample with JAGS.
##D if(require("rjags")) {
##D   samps <- with(bf, JAGS(x, y, family, start = opt$parameters))
##D   plot(samps)
##D }
## End(Not run)



