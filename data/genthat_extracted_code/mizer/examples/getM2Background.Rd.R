library(mizer)


### Name: getM2Background
### Title: Get predation mortality rate for plankton
### Aliases: getM2Background
###   getM2Background,MizerParams,matrix,numeric,array-method
###   getM2Background,MizerParams,matrix,numeric,missing-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D # With constant fishing effort for all gears for 20 time steps
##D sim <- project(params, t_max = 20, effort = 0.5)
##D # Get M2 of the background spectrum at one time step
##D n <- sim@n[21,,]
##D n_pp <- sim@n_pp[21,]
##D getM2Background(params,n,n_pp)
## End(Not run)



