library(mizer)


### Name: getMeanWeight
### Title: Calculate the mean weight of the community
### Aliases: getMeanWeight getMeanWeight,MizerSim-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D sim <- project(params, effort=1, t_max=10)
##D getMeanWeight(sim)
##D getMeanWeight(sim, species=c("Herring","Sprat","N.pout"))
##D getMeanWeight(sim, min_w = 10, max_w = 5000)
## End(Not run)



