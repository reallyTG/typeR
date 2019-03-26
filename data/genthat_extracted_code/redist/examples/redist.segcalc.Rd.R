library(redist)


### Name: redist.segcalc
### Title: Segregation index calculation for MCMC redistricting.
### Aliases: redist.segcalc

### ** Examples

## Not run: 
##D data(algdat.pfull)
##D 
##D ## Code to run the simulations in Figure 4 of Fifield, Higgins,
##D ## Imai and Tarr (2015)
##D 
##D ## Get an initial partition
##D set.seed(1)
##D initcds <- algdat.pfull$cdmat[,sample(1:ncol(algdat.pfull$cdmat), 1)]
##D 
##D ## Run simulations
##D alg_253 <- redist.mcmc(adjobj = algdat.pfull$adjlist,
##D popvec = algdat.pfull$precinct.data$pop,
##D initcds = initcds, nsims = 10000)
##D 
##D ## Get Republican Dissimilarity Index from simulations
##D rep_dmi_253 <- redist.segcalc(alg_253,
##D algdat.pfull$precinct.data$repvote,
##D algdat.pfull$precinct.data$pop)
## End(Not run)



