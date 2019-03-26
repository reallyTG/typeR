library(landscapemetrics)


### Name: get_boundaries
### Title: get_boundaries
### Aliases: get_boundaries

### ** Examples

class_1 <- get_patches(landscape, class = 1)[[1]]

get_boundaries(class_1)
get_boundaries(class_1, return_raster = FALSE)

class_1_matrix <- raster::as.matrix(class_1)
get_boundaries(class_1_matrix, return_raster = FALSE)




