library(geoRglm)


### Name: glsm.mcmc
### Title: Conditional Simulation for a generalised linear spatial model
### Aliases: glsm.mcmc
### Keywords: spatial

### ** Examples

## Don't show: 
library(geoR)
## End(Don't show)
if(!exists(".Random.seed", envir=.GlobalEnv, inherits = FALSE)) set.seed(1234)
data(b50)
test <- glsm.mcmc(b50, model = list(family="binomial",
             cov.pars = c(1,1), beta = c(1,0), trend =~ rnorm(50),
             cov.model="spherical", nugget=0.3),
          mcmc.input = mcmc.control(S.scale = 0.2, thin = 1))
## visulalising the MCMC output using the coda package
test.coda <- create.mcmc.coda(test, mcmc.input = list(thin = 1))
library(coda)
## Not run: 
##D plot(test.coda)
##D autocorr.plot(test.coda) 
## End(Not run)
## Don't show: 
plot(test.coda,ask=FALSE)
autocorr.plot(test.coda,ask=FALSE)
## End(Don't show)



