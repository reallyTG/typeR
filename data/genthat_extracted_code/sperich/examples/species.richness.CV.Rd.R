library(sperich)


### Name: species.richness.cv
### Title: Species richness cross-validation
### Aliases: species.richness.cv

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
species.richness.weighted <- species.richness.cv(dataset.all.species, 
		landwatermask.nocoast, fold=5, loocv.limit=10, distances=2:5, 
		weight=0.5, dimension, shift, resolution=1, upperbound=5, 
		all.species=1:2)



