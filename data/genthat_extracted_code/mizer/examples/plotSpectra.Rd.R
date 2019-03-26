library(mizer)


### Name: plotSpectra
### Title: Plot the abundance spectra
### Aliases: plotSpectra plotSpectra,MizerSim-method
###   plotSpectra,MizerParams-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D sim <- project(params, effort=1, t_max=20, t_save = 2)
##D plotSpectra(sim)
##D plotSpectra(sim, min_w = 1e-6)
##D plotSpectra(sim, time_range = 10:20)
##D plotSpectra(sim, time_range = 10:20, power = 0)
##D plotSpectra(sim, species = c("Cod", "Herring"), power = 1)
## End(Not run)



