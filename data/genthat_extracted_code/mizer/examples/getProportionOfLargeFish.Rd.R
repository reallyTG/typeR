library(mizer)


### Name: getProportionOfLargeFish
### Title: Calculate the proportion of large fish
### Aliases: getProportionOfLargeFish
###   getProportionOfLargeFish,MizerSim-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D sim <- project(params, effort=1, t_max=10)
##D getProportionOfLargeFish(sim)
##D getProportionOfLargeFish(sim, species=c("Herring","Sprat","N.pout"))
##D getProportionOfLargeFish(sim, min_w = 10, max_w = 5000)
##D getProportionOfLargeFish(sim, min_w = 10, max_w = 5000, threshold_w = 500)
##D getProportionOfLargeFish(sim, min_w = 10, max_w = 5000,
##D     threshold_w = 500, biomass_proportion=FALSE)
## End(Not run)



