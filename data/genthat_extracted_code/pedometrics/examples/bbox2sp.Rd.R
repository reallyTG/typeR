library(pedometrics)


### Name: bbox2sp
### Title: Create Spatial object from a bounding box
### Aliases: bbox2sp
### Keywords: misc spatial

### ** Examples

require(sp)
data(meuse)
coordinates(meuse) <- ~ x + y
bbox2sp(meuse, keep.crs = FALSE)



