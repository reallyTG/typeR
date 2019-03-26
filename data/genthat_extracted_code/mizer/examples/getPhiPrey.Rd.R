library(mizer)


### Name: getPhiPrey
### Title: Get available energy
### Aliases: getPhiPrey getPhiPrey,MizerParams,matrix,numeric-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D # With constant fishing effort for all gears for 20 time steps
##D sim <- project(params, t_max = 20, effort = 0.5)
##D n <- sim@n[21,,]
##D n_pp <- sim@n_pp[21,]
##D getPhiPrey(params,n,n_pp)
## End(Not run)



