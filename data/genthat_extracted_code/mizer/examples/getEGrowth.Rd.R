library(mizer)


### Name: getEGrowth
### Title: Get energy rate available for growth
### Aliases: getEGrowth
###   getEGrowth,MizerParams,matrix,numeric,matrix,matrix-method
###   getEGrowth,MizerParams,matrix,numeric,missing,missing-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D # Project with constant fishing effort for all gears for 20 time steps
##D sim <- project(params, t_max = 20, effort = 0.5)
##D # Get the energy at a particular time step
##D getEGrowth(params,sim@n[21,,],sim@n_pp[21,])
## End(Not run)



