library(mizer)


### Name: getPredRate
### Title: Get predation rate
### Aliases: getPredRate
###   getPredRate,MizerParams,matrix,numeric,matrix-method
###   getPredRate,MizerParams,matrix,numeric,missing-method

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
##D getPredRate(params,n,n_pp)
## End(Not run)



