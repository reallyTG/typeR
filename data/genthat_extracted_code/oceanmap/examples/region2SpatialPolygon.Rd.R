library(oceanmap)


### Name: region2SpatialPolygon
### Title: creates polygon from raster extent
### Aliases: region2SpatialPolygon extent2SpatialPolygon
### Keywords: internal

### ** Examples

r <- regions("lion")
ext <- extent(c(r$xlim,r$ylim))
extent2SpatialPolygon(ext)

region2SpatialPolygon("lion")



