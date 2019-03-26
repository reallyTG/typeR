library(sperich)


### Name: species.richness.nonweighted
### Title: Species richness estimation without weighting
### Aliases: species.richness.nonweighted

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
species.richness.noweight <- species.richness.nonweighted(dataset.all.species, 
		landwatermask.nocoast, distance=5, dimension, 
		shift, resolution=1, upperbound=5, all.species=1:2)



