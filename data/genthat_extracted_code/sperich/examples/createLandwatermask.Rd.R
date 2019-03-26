library(sperich)


### Name: createLandwatermask
### Title: Land-Water-Mask Creation
### Aliases: createLandwatermask

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



