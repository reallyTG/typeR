library(landscapemetrics)


### Name: get_circumscribingcircle
### Title: get_circumscribingcircle
### Aliases: get_circumscribingcircle get_circumscribingcircle.RasterLayer
###   get_circumscribingcircle.matrix

### ** Examples

# get patches for class 1 from testdata as raster
class_1 <- get_patches(landscape, class = 1)[[1]]

# calculate the minimum circumscribing circle of each patch in class 1
get_circumscribingcircle(class_1)

# do the same with a 3 column matrix (x, y, id)
class_1_matrix <- raster::rasterToPoints(class_1)
get_circumscribingcircle(class_1_matrix, resolution_x = 1, resolution_y = 1)




