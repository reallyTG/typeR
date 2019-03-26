library(landscapemetrics)


### Name: sample_lsm
### Title: sample_lsm
### Aliases: sample_lsm sample_lsm.RasterLayer sample_lsm.RasterStack
###   sample_lsm.RasterBrick sample_lsm.list

### ** Examples

points <- matrix(c(10, 5, 25, 15, 5, 25), ncol = 2, byrow = TRUE)
sample_lsm(landscape, points = points, size = 15, what = "lsm_l_np")

points_sp <- sp::SpatialPoints(points)
sample_lsm(landscape, points = points_sp, size = 15, what = "lsm_l_np", return_plots = TRUE)




