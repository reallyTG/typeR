library(redist)


### Name: redist.combine
### Title: Combine successive runs of 'redist.mcmc'
### Aliases: redist.combine

### ** Examples

## Not run: 
##D data(algdat.pfull)
##D 
##D ## Code to run the simulations in Figure 4 in Fifield, Higgins,Imai and
##D Tarr (2015)
##D 
##D ## Get an initial partition
##D set.seed(1)
##D initcds <- algdat.pfull$cdmat[,sample(1:ncol(algdat.pfull$cdmat), 1)]
##D 
##D ## Run the algorithm
##D alg_253 <- redist.mcmc(adjobj = algdat.pfull$adjlist,
##D popvec = algdat.pfull$precinct.data$pop,
##D initcds = initcds,
##D nsims = 10000, nloops = 2, savename = "test")
##D out <- redist.combine(savename = "test", nsims = 10000, nloop = 2,
##D nthin = 10, nunits = length(algdat.pfull$adjlist))
## End(Not run)



