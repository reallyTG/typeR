library(sperich)


### Name: evaluate
### Title: Result grid evaluation
### Aliases: evaluate

### ** Examples

#load data
data(dataset.all.species)
data(dataset.landwater)

#create grid parameters
dimension <- getDimension(dataset.all.species, resolution=1)
shift <- getShift(dataset.all.species)

#create landwatermask
landwatermask.nocoast <- createLandwatermask(dataset.landwater,
dimension, shift, resolution=1)

#estimate species richness
species.richness.weighted <- species.richness(dataset.all.species,
landwatermask.nocoast, distances=1:5, weight=0.5, dimension,
shift, resolution=1, upperbound=3000, all.species=1:2)

#evaluation
## Not run: 
##D evaluate(species.richness.weighted, NULL, title.one="Histogramm 1")
## End(Not run)



