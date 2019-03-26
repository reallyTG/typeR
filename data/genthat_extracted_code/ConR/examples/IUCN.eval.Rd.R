library(ConR)


### Name: IUCN.eval
### Title: Preliminary conservation status assessment following IUCN
###   Criterion B
### Aliases: IUCN.eval

### ** Examples


data(dataset.ex)
data(land)
## Not run: 
##D Results <- IUCN.eval(dataset.ex, country_map=land)
##D ## A directory has been created in your working directory 
##D and maps for each species has been produced
##D 
##D ### The method for computing locations is a sliding scale:
##D ## the grid resolution will be 0.05*the maximum distance separating occurrences
##D Results <- IUCN.eval(dataset.ex, 
##D                      country_map=land, Cell_size_locations=10,
##D                      Resol_sub_pop = 5, Cell_size_AOO = 4, method_locations="sliding scale")
##D 		
## End(Not run)			 
## Not run: 
##D ## Install speciesgeocodeR package for an example with their lemurs dataset
##D library(speciesgeocodeR)
##D data("lemurs_in")
##D 
##D Results <- IUCN.eval(lemurs_in, DrawMap=FALSE, country_map=land, SubPop=FALSE)
##D 
##D 
##D 
## End(Not run)
					 

					 



