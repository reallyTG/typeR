library(OpasnetUtils)


### Name: GIS
### Title: Opasnet spatially distributed data interfaces
### Aliases: GIS GIS.Exposure GIS.Concentration.matrix

### ** Examples

## Not run: 
##D # Excerpt from http://en.opasnet.org/w/Health_impacts_of_fine_particles_in_Rauma 
##D # (not evaluated)
##D 
##D # Paasto Emissions
##D 
##D Paasto <- new(
##D 	"ovariable", 
##D 	name = "Paasto",
##D 	dependencies = data.frame(Name = "tieliikennepaastot", Key = "0194s0uuucjxq8Wi"),
##D 	formula = function(dependencies, ...) {
##D 		ComputeDependencies(dependencies, ...)
##D 		
##D 		# Muutetaan paivapaasto vuosipaastoksi ja grammat tonneiksi
##D 		out <- tieliikennepaastot * 365 * 1E-6 
##D 
##D 		return(out)
##D 	}
##D )
##D 
##D # Muita tarpeellisia arvoja Other important values
##D 
##D bg.mort <- 45182 / 5203826 # same values as used in PILTTI
##D 
##D ## J. T. Tuomisto, A. Wilson, et al. Uncertainty in mortality response to 
##D ## airborne fine particulate matter... 2008
##D erf <- 0.0097 
##D # unit: m^3 /ug
##D 
##D # Ovariablet
##D 
##D ## Pitoisuudet Concentrations
##D 
##D Pitoisuus <- new(
##D 	"ovariable", 
##D 	name = "Pitoisuus",
##D 	dependencies = data.frame(
##D 		Name = c("Paasto", "LO", "LA")
##D 	),
##D 	formula =  function(dependencies, ...) {
##D 		ComputeDependencies(dependencies, ...)
##D 
##D 		temp <- GIS.Concentration.matrix(Paasto, LO, LA, ...)
##D 
##D 		return(temp)
##D 	} 
##D )
##D 
##D ## Altistuminen Exposure
##D 
##D Altistuminen <- new(
##D 	"ovariable", 
##D 	name = "Altistuminen", 
##D 	dependencies = data.frame(
##D 		Name = c("Pitoisuus", "LO", "LA")
##D 	),
##D 	formula = function(dependencies, ...) {
##D 		ComputeDependencies(dependencies, ...)
##D 
##D 		out <- GIS.Exposure(Pitoisuus, LO, LA, ...)
##D 
##D 		return(out)
##D 	}
##D )
##D 
## End(Not run)



