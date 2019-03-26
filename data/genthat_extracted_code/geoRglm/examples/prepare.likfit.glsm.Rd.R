library(geoRglm)


### Name: prepare.likfit.glsm
### Title: Prepare for Monte Carlo MLE
### Aliases: prepare.likfit.glsm
### Keywords: spatial

### ** Examples

## Not run: 
##D data(p50)
##D mcmc.4 <- mcmc.control(S.scale = 0.000035, n.iter = 1000)
##D kr4 <- list(family="poisson", cov.pars=c(1,1), beta=0)
##D condsim.4 <- glsm.mcmc(p50, mcmc.input = mcmc.4, model = kr4)     
##D mcmcobj.4 <- prepare.likfit.glsm(condsim.4)   
##D lik.4 <- likfit.glsm(mcmcobj.4, ini.phi = 10, fix.nugget.rel = TRUE) 
##D lik.4.spherical.nugget <- likfit.glsm(mcmcobj.4, ini.phi = 5.59, 
##D                               cov.model = "spherical", nugget.rel = 0.385)
## End(Not run)



