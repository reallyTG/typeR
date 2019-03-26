library(redist)


### Name: redist.ipw
### Title: Inverse probability reweighting for MCMC Redistricting
### Aliases: redist.ipw

### ** Examples

## Not run: 
##D data(algdat.p20)
##D 
##D ## Code to run the simulations in Figure 4 of Fifield, Higgins,
##D ## Imai and Tarr (2015)
##D 
##D ## Get an initial partition
##D set.seed(1)
##D initcds <- algdat.p20$cdmat[,sample(1:ncol(algdat.p20$cdmat), 1)]
##D 
##D ## Vector of beta weights
##D betaweights <- rep(NA, 10); for(i in 1:10){betaweights[i] <- 4^i}
##D 
##D ## Run simulations - tempering population constraint
##D alg_253_20_st <- redist.mcmc(adjobj = algdat.p20$adjlist,
##D popvec = algdat.p20$precinct.data$pop,
##D initcds = initcds, nsims = 10000, betapop = -5.4,
##D betaweights = betaweights, temperbetapop = 1)
##D 
##D ## Resample using inverse probability weighting.
##D ## Target distance from parity is 20%
##D alg_253_20_st <- redist.ipw(alg_253_20_st,
##D resampleconstraint = "pop",
##D targetbeta = -5.4,
##D targetpop = .2, temper = 1)
## End(Not run)



