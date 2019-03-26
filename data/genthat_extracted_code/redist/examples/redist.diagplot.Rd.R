library(redist)


### Name: redist.diagplot
### Title: Diagnostic plotting functionality for MCMC redistricting.
### Aliases: redist.diagplot

### ** Examples

## Not run: 
##D data(algdat.pfull)
##D 
##D ## Get an initial partition
##D set.seed(1)
##D initcds <- algdat.pfull$cdmat[,sample(1:ncol(algdat.pfull$cdmat), 1)]
##D 
##D ## 25 precinct, three districts - no pop constraint ##
##D alg_253 <- redist.mcmc(adjobj = algdat.pfull$adjlist,
##D popvec = algdat.pfull$precinct.data$pop,
##D initcds = initcds,nsims = 10000)
##D 
##D ## Get Republican Dissimilarity Index from simulations
##D rep_dmi_253 <- redist.segcalc(alg_253,
##D algdat.pfull$precinct.data$repvote,
##D algdat.pfull$precinct.data$pop)
##D 
##D ## Generate diagnostic plots
##D redist.diagplot(rep_dmi_253, plot = "trace")
##D redist.diagplot(rep_dmi_253, plot = "autocorr")
##D redist.diagplot(rep_dmi_253, plot = "densplot")
##D redist.diagplot(rep_dmi_253, plot = "mean")
## End(Not run)



