library(landscapemetrics)


### Name: extract_lsm
### Title: extract_lsm
### Aliases: extract_lsm extract_lsm.RasterLayer extract_lsm.RasterStack
###   extract_lsm.RasterBrick extract_lsm.stars extract_lsm.list

### ** Examples

points <- matrix(c(10, 5, 25, 15, 5, 25), ncol = 2, byrow = TRUE)
extract_lsm(landscape, points)
extract_lsm(landscape, points, type = "aggregation metric")

points_sp <- sp::SpatialPoints(points)
extract_lsm(landscape, points, what = "lsm_p_area")




