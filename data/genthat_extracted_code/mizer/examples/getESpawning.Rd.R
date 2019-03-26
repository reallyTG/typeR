library(mizer)


### Name: getESpawning
### Title: Get energy rate available for reproduction
### Aliases: getESpawning
###   getESpawning,MizerParams,matrix,numeric,matrix-method
###   getESpawning,MizerParams,matrix,numeric,missing-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D # Project with constant fishing effort for all gears for 20 time steps
##D sim <- project(params, t_max = 20, effort = 0.5)
##D # Get the energy at a particular time step
##D getESpawning(params,sim@n[21,,],sim@n_pp[21,])
## End(Not run)



