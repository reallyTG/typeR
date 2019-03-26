library(sperich)


### Name: getNarrowEndemics
### Title: Narrow endemic species extraction
### Aliases: getNarrowEndemics

### ** Examples

## load data
data(dataset.all.species)

## create grid parameters
dimension <- getDimension(dataset.all.species, resolution=1)
shift <- getShift(dataset.all.species)

## search narrow endemic species in row 100 to 200 in the dataset
narrow.endemic.species <- getNarrowEndemics(dataset.all.species,
				all.species=100:200, narrow.endemic.limit=8,
				dimension, shift, resolution=1)



