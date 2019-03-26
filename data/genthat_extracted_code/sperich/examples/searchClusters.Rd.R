library(sperich)


### Name: searchClusters
### Title: Search clusters in the result grid of species richness
###   estimation.
### Aliases: searchClusters

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

##prepare clustersearch
clusterlimit <- 100

##adjust species richness
clusterlist <- searchClusters(species.richness.weighted, 
		dimension, shift, resolution=1, clusterlimit)



