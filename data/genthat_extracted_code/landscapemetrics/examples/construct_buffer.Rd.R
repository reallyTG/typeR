library(landscapemetrics)


### Name: construct_buffer
### Title: construct_buffer
### Aliases: construct_buffer construct_buffer.matrix
###   construct_buffer.SpatialPoints
###   construct_buffer.SpatialPointsDataFrame construct_buffer.MULTIPOINT
###   construct_buffer.POINT construct_buffer.sf construct_buffer.sfc
### Keywords: internal

### ** Examples

points <- matrix(c(10, 5, 25, 15, 5, 25), ncol = 2, byrow = TRUE)
construct_buffer(points = points, shape = "square", size = 5)




