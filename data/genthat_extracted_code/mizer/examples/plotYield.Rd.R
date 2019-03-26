library(mizer)


### Name: plotYield
### Title: Plot the total yield of species through time
### Aliases: plotYield plotYield,MizerSim,missing-method
###   plotYield,MizerSim,MizerSim-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D sim <- project(params, effort=1, t_max=20, t_save = 0.2)
##D plotYield(sim)
##D plotYield(sim, species = c("Cod", "Herring"), total = TRUE)
##D 
##D # Comparing with yield from twice the effort
##D sim2 <- project(params, effort=2, t_max=20, t_save = 0.2)
##D plotYield(sim, sim2, species = c("Cod", "Herring"), log = FALSE)
## End(Not run)



