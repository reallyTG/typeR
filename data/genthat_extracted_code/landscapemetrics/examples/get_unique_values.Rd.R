library(landscapemetrics)


### Name: get_unique_values
### Title: get_unique_values
### Aliases: get_unique_values get_unique_values.numeric
###   get_unique_values.matrix get_unique_values.RasterLayer
###   get_unique_values.list get_unique_values.RasterStack
###   get_unique_values.RasterBrick

### ** Examples

get_unique_values(landscape)

landscape_stack <- raster::stack(landscape, landscape, landscape)
get_unique_values(landscape_stack)

landscape_matrix <- raster::as.matrix(landscape)
get_unique_values(landscape_matrix)

x_vec <- c(1, 2, 1, 1, 2, 2)
get_unique_values(x_vec)

landscape_list <- list(landscape, landscape_matrix, x_vec)
get_unique_values(landscape_list)




