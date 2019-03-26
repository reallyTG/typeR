library(recmap)


### Name: as.SpatialPolygonsDataFrame.recmap
### Title: Convert a recmap Object to SpatialPolygonsDataFrame Object
### Aliases: as.SpatialPolygonsDataFrame.recmap as.SpatialPolygonsDataFrame
###   recmap2sp

### ** Examples

  SpDf <- as.SpatialPolygonsDataFrame(recmap(checkerboard(8)))
  summary(SpDf)
  spplot(SpDf)



