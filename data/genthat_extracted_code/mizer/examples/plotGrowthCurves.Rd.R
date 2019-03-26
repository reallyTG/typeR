library(mizer)


### Name: plotGrowthCurves
### Title: Plot growth curves giving weight as a function of age
### Aliases: plotGrowthCurves plotGrowthCurves,MizerSim-method
###   plotGrowthCurves,MizerParams-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D sim <- project(params, effort=1, t_max=20, t_save = 2)
##D plotGrowthCurves(sim, percentage = TRUE)
##D plotGrowthCurves(sim, species = "Cod", max_age = 24)
## End(Not run)



