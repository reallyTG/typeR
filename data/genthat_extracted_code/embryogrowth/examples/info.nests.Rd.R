library(embryogrowth)


### Name: info.nests
### Title: Calculte statistics about nests
### Aliases: info.nests

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(resultNest_4p_SSM4p)
##D summary.nests <- info.nests(resultNest_4p_SSM4p, out="summary", 
##D   embryo.stages="Caretta caretta.SCL", 
##D   replicate.CI=100, 
##D   resultmcmc=resultNest_mcmc_4p_SSM4p, 
##D   CI="MCMC", 
##D   progress=TRUE)
##D   # Result is in summary.nests$summary
##D infoall <- info.nests(resultNest_4p_SSM4p)
##D   # Result is a value
##D infoall.df <- info.nests(resultNest_4p_SSM4p, out="metric", 
##D   embryo.stages="Caretta caretta.SCL", 
##D   replicate.CI=100, 
##D   resultmcmc=resultNest_mcmc_4p_SSM4p, 
##D   CI="MCMC", 
##D   progress=TRUE)
##D # Result is in summary.nests$metric
##D infoall.both <- info.nests(resultNest_4p_SSM4p, 
##D   embryo.stages="Caretta caretta.SCL", 
##D   out=c("metric", "summary"), replicate.CI=100, 
##D   resultmcmc=resultNest_mcmc_4p_SSM4p, 
##D   CI="MCMC", 
##D   progress=TRUE)
##D # Results are in summary.nests$summary and in summary.nests$metric
##D infoall.both <- info.nests(resultNest_4p_SSM4p, 
##D   embryo.stages="Caretta caretta.SCL", 
##D   out=c("metric", "summary"), replicate.CI=100, 
##D   CI="Hessian", 
##D   progress=TRUE)
##D infoall.both <- info.nests(resultNest_4p_SSM4p, 
##D   embryo.stages="Caretta caretta.SCL", 
##D   out=c("metric", "summary"), replicate.CI=100, 
##D   CI="SE", 
##D   progress=TRUE)
## End(Not run)



