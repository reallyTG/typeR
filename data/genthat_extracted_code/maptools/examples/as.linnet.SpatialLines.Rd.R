library(maptools)


### Name: as.linnet.SpatialLines
### Title: Convert SpatialLines to Linear Network
### Aliases: as.linnet.SpatialLines coerce,SpatialLines,linnet-method
###   coerce,SpatialLinesDataFrame,linnet-method
### Keywords: spatial manip

### ** Examples

  if(require(spatstat, quietly=TRUE)) {
   dname <- system.file("shapes", package="maptools")
   fname <- file.path(dname, "fylk-val.shp")
   fylk <- readShapeSpatial(fname)
   L <- as(fylk, "linnet")
   print(max(vertexdegree(L)))
   L0 <- as.linnet.SpatialLines(fylk, fuse=FALSE)
   print(max(vertexdegree(L0)))
  }



