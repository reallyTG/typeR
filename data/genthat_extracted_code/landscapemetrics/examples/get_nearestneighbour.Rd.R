library(landscapemetrics)


### Name: get_nearestneighbour
### Title: get_nearestneighbour
### Aliases: get_nearestneighbour get_nearestneighbour.RasterLayer
###   get_nearestneighbour.matrix

### ** Examples

# get patches for class 1 from testdata as raster
class_1 <- get_patches(landscape,1)[[1]]

# calculate the distance between patches
get_nearestneighbour(class_1)

# do the same with a 3 column matrix (x, y, id)
class_1_matrix <- raster::rasterToPoints(class_1)
get_nearestneighbour(class_1_matrix)




