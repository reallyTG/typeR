library(raster)


### Name: Compare-methods
### Title: Compare Raster* objects
### Aliases: Compare-methods Compare,Extent,Extent-method
###   Compare,Raster,Raster-method Compare,Raster,logical-method
###   Compare,Raster,numeric-method Compare,logical,Raster-method
###   Compare,numeric,Raster-method ==,BasicRaster,BasicRaster-method
###   !=,BasicRaster,BasicRaster-method
### Keywords: methods math

### ** Examples

r1 <- raster()
r1 <- setValues(r1, round(10 * runif(ncell(r1))))
r2 <- setValues(r1, round(10 * runif(ncell(r1))))
as(r1, 'BasicRaster') == as(r2, 'BasicRaster')
r3 <- r1 == r2

b <- extent(0, 360, 0, 180)
r4 <- setExtent(r2, b)
as(r2, 'BasicRaster') != as(r4, 'BasicRaster')
# The following would give an error. You cannot compare RasterLayer 
# that do not have the same BasicRaster properties.
#r3 <- r1 > r4



