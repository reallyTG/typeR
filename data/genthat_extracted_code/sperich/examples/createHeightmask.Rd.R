library(sperich)


### Name: createHeightmask
### Title: Height-Mask Creation
### Aliases: createHeightmask

### ** Examples

##load data
data(dataset.all.species)
data(dataset.height)

##create grid parameters
dimension <- getDimension(dataset.all.species, resolution=1)
shift <- getShift(dataset.all.species)

##create height-matrix
height.matrix <- createHeightmask(dataset.height, dimension, shift, resolution=1)



