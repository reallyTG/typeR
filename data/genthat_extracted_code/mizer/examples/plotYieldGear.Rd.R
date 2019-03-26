library(mizer)


### Name: plotYieldGear
### Title: Plot the total yield of each species by gear through time
### Aliases: plotYieldGear plotYieldGear,MizerSim-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D sim <- project(params, effort=1, t_max=20, t_save = 0.2)
##D plotYieldGear(sim)
##D plotYieldGear(sim, species = c("Cod", "Herring"), total = TRUE)
## End(Not run)



