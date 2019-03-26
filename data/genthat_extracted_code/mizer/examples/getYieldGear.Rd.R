library(mizer)


### Name: getYieldGear
### Title: Calculate the total yield per gear and species
### Aliases: getYieldGear getYieldGear,MizerSim-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D # With constant fishing effort for all gears for 20 time steps
##D sim <- project(params, t_max = 20, effort = 0.5)
##D getYieldGear(sim)
## End(Not run)



