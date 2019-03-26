library(ConR)


### Name: map.res
### Title: Mapping in grid cell results of IUCN.eval
### Aliases: map.res

### ** Examples

## Not run: 
##D data(land)
##D data(Malagasy_amphibian)
##D Results <- IUCN.eval(Malagasy_amphibian, DrawMap=FALSE, country_map=land, SubPop=FALSE)
##D ### This should run for 3 to 6 minutes depending of the computer.
##D 
##D ### Maps covering the whole dataset with a minimum of 5 records in each cell
##D map.res(Results=Results, Occurrences=Malagasy_amphibian, country_map=land, 
##D export_map=FALSE, threshold=5)
##D 
##D ## Maps focusing on Madagascar with a minimum of 5 records in each cell
##D map.res(Results=Results, Occurrences=Malagasy_amphibian, country_map=land, export_map=FALSE, 
##D 	threshold=5, LatMin=-25,LatMax=-12,LongMin=42, LongMax=52)
##D 
##D ## Maps focusing on Madagascar at half degree resolution with a minimum of 5 records in each cell
##D map.res(Results=Results, Occurrences=Malagasy_amphibian, country_map=land, 
##D export_map=FALSE,Resol=0.5, 
##D 	threshold=5, LatMin=-25,LatMax=-12,LongMin=42, LongMax=52)
##D 
##D ## Maps have been exported in the directory IUCN__results_map
##D map.res(Results=Results, Occurrences=Malagasy_amphibian, country_map=land, export_map=TRUE, 
##D 	threshold=5, LatMin=-25,LatMax=-12,LongMin=42, LongMax=52)
##D 
##D ## Install speciesgeocodeR package for an example with their lemurs dataset
##D library(speciesgeocodeR)
##D data("lemurs_in")
##D 
##D Results <- IUCN.eval(lemurs_in, DrawMap=FALSE, country_map=land, SubPop=FALSE)
##D 
##D map.res(Results=Results, Occurrences=lemurs_in, country_map=land, export_map=FALSE, threshold=3, 
##D 	LatMin=-25,LatMax=-12,LongMin=42, LongMax=52, Resol=1)
##D 
## End(Not run)






