library(shadow)


### Name: toSeg
### Title: Split polygons or lines to segments
### Aliases: toSeg

### ** Examples

seg = toSeg(build[1, ])
plot(seg, col = sample(rainbow(length(seg))))
raster::text(rgeos::gCentroid(seg, byid = TRUE), 1:length(seg))

# Other data structures
toSeg(geometry(build)) # SpatialPolygons
toSeg(boston_sidewalk) # SpatialLinesDataFrame
toSeg(geometry(boston_sidewalk)) # SpatialLinesDataFrame




