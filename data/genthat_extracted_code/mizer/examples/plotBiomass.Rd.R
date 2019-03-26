library(mizer)


### Name: plotBiomass
### Title: Plot the biomass of species through time
### Aliases: plotBiomass plotBiomass,MizerSim-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D sim <- project(params, effort=1, t_max=20, t_save = 0.2)
##D plotBiomass(sim)
##D plotBiomass(sim, species = c("Cod", "Herring"), total = TRUE)
##D plotBiomass(sim, min_w = 10, max_w = 1000)
##D plotBiomass(sim, start_time = 10, end_time = 15)
##D plotBiomass(sim, y_ticks = 3)
## End(Not run)



