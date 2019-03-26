library(mizer)


### Name: getZ
### Title: Get total mortality rate
### Aliases: getZ getZ,MizerParams,matrix,numeric,numeric,matrix-method
###   getZ,MizerParams,matrix,numeric,numeric,missing-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D # Project with constant fishing effort for all gears for 20 time steps
##D sim <- project(params, t_max = 20, effort = 0.5)
##D # Get the total mortality at a particular time step
##D getZ(params,sim@n[21,,],sim@n_pp[21,],effort=0.5)
## End(Not run)



