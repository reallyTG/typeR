library(mizer)


### Name: getN
### Title: Calculate the total abundance in terms of numbers of species
###   within a size range
### Aliases: getN getN,MizerSim-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D # With constant fishing effort for all gears for 20 time steps
##D sim <- project(params, t_max = 20, effort = 0.5)
##D getN(sim)
##D getN(sim, min_w = 10, max_w = 1000)
## End(Not run)



