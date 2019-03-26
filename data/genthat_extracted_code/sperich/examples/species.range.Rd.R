library(sperich)


### Name: species.range
### Title: Species range estimation
### Aliases: species.range

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

##extract datasets of one species out of database
dataset.one.species <- extract.species(dataset.all.species, 3)

##estimate species range
species.range.tmp <- species.range(dataset.one.species, distance=5, 
		dimension, shift, resolution=1, landwatermask.nocoast)



