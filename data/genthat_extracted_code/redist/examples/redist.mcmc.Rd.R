library(redist)


### Name: redist.mcmc
### Title: MCMC Redistricting Simulator
### Aliases: redist.mcmc

### ** Examples

## Not run: 
##D data(algdat.pfull)
##D ## Code to run the simulations in Figure 4 in Fifield, Higgins,
##D ## Imai and Tarr (2015)
##D 
##D ## Get an initial partition
##D set.seed(1)
##D initcds <- algdat.pfull$cdmat[,sample(1:ncol(algdat.pfull$cdmat), 1)]
##D 
##D ## Run the algorithm
##D alg_253 <- redist.mcmc(adjobj = algdat.pfull$adjlist,
##D popvec = algdat.pfull$precinct.data$pop,
##D initcds = initcds,
##D nsims = 10000)
## End(Not run)



