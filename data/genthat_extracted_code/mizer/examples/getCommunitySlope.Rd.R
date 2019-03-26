library(mizer)


### Name: getCommunitySlope
### Title: Calculate the slope of the community abundance
### Aliases: getCommunitySlope getCommunitySlope,MizerSim-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D sim <- project(params, effort=1, t_max=40, dt = 1, t_save = 1)
##D # Slope based on biomass, using all species and sizes
##D slope_biomass <- getCommunitySlope(sim)
##D # Slope based on numbers, using all species and sizes
##D slope_numbers <- getCommunitySlope(sim, biomass=FALSE)
##D # Slope based on biomass, using all species and sizes between 10g and 1000g
##D slope_biomass <- getCommunitySlope(sim, min_w = 10, max_w = 1000)
##D # Slope based on biomass, using only demersal species and sizes between 10g and 1000g
##D dem_species <- c("Dab","Whiting","Sole","Gurnard","Plaice","Haddock", "Cod","Saithe")
##D slope_biomass <- getCommunitySlope(sim, species = dem_species, min_w = 10, max_w = 1000)
## End(Not run)



