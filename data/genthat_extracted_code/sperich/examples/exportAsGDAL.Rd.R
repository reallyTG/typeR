library(sperich)


### Name: exportAsGDAL
### Title: Export result grid as GDAL grid map
### Aliases: exportAsGDAL

### ** Examples

##load data
data(dataset.all.species)
data(dataset.landwater)

##create grid parameters
dimension <- getDimension(dataset.all.species, resolution=1)
shift <- getShift(dataset.all.species)

##create landwatermask
landwatermask.nocoast <- createLandwatermask(dataset.landwater, 
						dimension, shift, resolution=1)

##estimate species richness
species.richness.weighted <- species.richness(dataset.all.species,
	landwatermask.nocoast, distances=1:5, weight=0.5, dimension,
	shift, resolution=1, upperbound=3000, all.species=1:2)

##export
exportAsGDAL(species.richness.weighted, shift, resolution=1, 
	    directory=getwd(), filename="species.richness.tif", drivername="GTiff")



