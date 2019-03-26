library(mizer)


### Name: setBackground
### Title: Designate species as background species
### Aliases: setBackground setBackground,MizerParams-method
###   setBackground,MizerSim-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D sim <- project(params, effort=1, t_max=20, t_save = 0.2)
##D sim <- setBackground(sim, species = c("Sprat", "Sandeel", 
##D                                             "N.pout", "Dab", "Saithe"))
##D plotSpectra(sim)
## End(Not run)



