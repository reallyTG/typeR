library(mizer)


### Name: getFeedingLevel
### Title: Get feeding level
### Aliases: getFeedingLevel
###   getFeedingLevel,MizerParams,matrix,numeric,matrix-method
###   getFeedingLevel,MizerParams,matrix,numeric,missing-method
###   getFeedingLevel,MizerSim,missing,missing,missing-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D # With constant fishing effort for all gears for 20 time steps
##D sim <- project(params, t_max = 20, effort = 0.5)
##D # Get the feeding level at one time step
##D n <- sim@n[21,,]
##D n_pp <- sim@n_pp[21,]
##D fl <- getFeedingLevel(params,n,n_pp)
##D # Get the feeding level at all saved time steps
##D fl <- getFeedingLevel(sim)
##D # Get the feeding level for time 15 - 20
##D fl <- getFeedingLevel(sim, time_range = c(15,20))
## End(Not run)



