library(mizer)


### Name: plot,MizerSim,missing-method
### Title: Summary plot for 'MizerSim' objects
### Aliases: plot,MizerSim,missing-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D sim <- project(params, effort=1, t_max=20, t_save = 2)
##D plot(sim)
##D plot(sim, time_range = 10:20) # change time period for size-based plots
##D plot(sim, min_w = 10, max_w = 1000) # change size range for biomass plot
## End(Not run)



