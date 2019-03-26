library(amt)


### Name: dist_cent
### Title: Distance to center
### Aliases: dist_cent distance_to_center distance_to_center.track_xy
###   distance_to_centers distance_to_centers.track_xy

### ** Examples

data(deer)
r <- raster::raster(bbox(deer, buffer = 100), res = 40)
d1 <- distance_to_center(deer, r)
d2 <- distance_to_centers(deer, r, top_n = 1)
d3 <- distance_to_centers(deer, r, top_n = 10)



