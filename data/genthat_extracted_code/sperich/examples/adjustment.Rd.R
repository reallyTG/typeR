library(sperich)


### Name: adjustment
### Title: Adjustment of interpolated species richness
### Aliases: adjustment

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
		landwatermask.nocoast, distances=1:5, weight=0.5, dimension, shift, resolution=1,
		upperbound=5, all.species=1:2)

##prepare adjustment
noninterpolatedgrid <- createNonInterpolatedGrid(dataset.all.species, 
				dimension, shift, resolution=1, all.species=-1)
clusterlimit <- 100

clusterlist <- searchClusters(species.richness.weighted, 
		dimension, shift, resolution=1, clusterlimit)

##adjust species richness
species.richness.weighted.adjusted <- adjustment(species.richness.weighted, 
		noninterpolatedgrid, clusterlist)



