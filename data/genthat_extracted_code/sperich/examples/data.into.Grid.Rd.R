library(sperich)


### Name: data.into.Grid
### Title: Species occurrences to grid
### Aliases: data.into.Grid

### ** Examples

##load data
data(dataset.all.species)

##create grid parameters
dimension <- getDimension(dataset.all.species, resolution=1)
shift <- getShift(dataset.all.species)

#extract datasets of one species out of database
dataset.one.species <- extract.species(dataset.all.species, 3)

##add species occurrence information to grid
grid <- data.into.Grid(dataset.one.species, dimension, shift, resolution=1)



