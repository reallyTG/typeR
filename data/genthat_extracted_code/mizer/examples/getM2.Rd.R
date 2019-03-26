library(mizer)


### Name: getM2
### Title: getM2 method for the size based model
### Aliases: getM2 getM2,MizerParams,missing,missing,array-method
###   getM2,MizerParams,matrix,numeric,missing-method
###   getM2,MizerSim,missing,missing,missing-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D # With constant fishing effort for all gears for 20 time steps
##D sim <- project(params, t_max = 20, effort = 0.5)
##D # Get M2 at one time step
##D n <- sim@n[21,,]
##D n_pp <- sim@n_pp[21,]
##D getM2(params,n,n_pp)
##D # Get M2 at all saved time steps
##D getM2(sim)
##D # Get M2 over the time 15 - 20
##D getM2(sim, time_range = c(15,20))
## End(Not run)



