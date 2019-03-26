library(redist)


### Name: redist.findparams
### Title: Run parameter testing for 'redist.mcmc'
### Aliases: redist.findparams

### ** Examples

## Not run: 
##D data(algdat.pfull)
##D 
##D ## Code to run the simulations in Figure 4 in Fifield, Higgins, Imai and
##D ## Tarr (2015)
##D 
##D ## Get an initial partition
##D set.seed(1)
##D initcds <- algdat.pfull$cdmat[,sample(1:ncol(algdat.pfull$cdmat), 1)]
##D 
##D params <- expand.grid(eprob = c(.01, .05, .1))
##D 
##D ## Run the algorithm
##D redist.findparams(adjobj = algdat.pfull$adjlist,
##D popvec = algdat.pfull$precinct.data$pop,
##D initcds = initcds, nsims = 10000, params = params)
## End(Not run)



