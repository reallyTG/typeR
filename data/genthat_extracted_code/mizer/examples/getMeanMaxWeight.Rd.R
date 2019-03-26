library(mizer)


### Name: getMeanMaxWeight
### Title: Calculate the mean maximum weight of the community
### Aliases: getMeanMaxWeight getMeanMaxWeight,MizerSim-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D sim <- project(params, effort=1, t_max=10)
##D getMeanMaxWeight(sim)
##D getMeanMaxWeight(sim, species=c("Herring","Sprat","N.pout"))
##D getMeanMaxWeight(sim, min_w = 10, max_w = 5000)
## End(Not run)



