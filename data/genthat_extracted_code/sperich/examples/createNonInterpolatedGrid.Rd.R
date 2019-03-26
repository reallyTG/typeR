library(sperich)


### Name: createNonInterpolatedGrid
### Title: Create a species occurrences grid with no interpolation
### Aliases: createNonInterpolatedGrid

### ** Examples

##load data
data(dataset.all.species)
data(dataset.landwater)

##create grid parameters
dimension <- getDimension(dataset.all.species, resolution=1)
shift <- getShift(dataset.all.species)
resolution <- 1
all.species <- -1

##create grid containing species occurrences
species.occurrences <- createNonInterpolatedGrid(dataset.all.species, 
				dimension, shift, resolution, all.species)



