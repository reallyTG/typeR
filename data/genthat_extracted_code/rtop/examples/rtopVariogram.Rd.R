library(rtop)


### Name: rtopVariogram
### Title: create variogram for data with spatial support
### Aliases: rtopVariogram rtopVariogram.rtop
###   rtopVariogram.SpatialPolygonsDataFrame
###   rtopVariogram.SpatialPointsDataFrame rtopVariogram.STSDF
### Keywords: spatial

### ** Examples

## Not run: 
##D library(rgdal)
##D rpath = system.file("extdata",package="rtop")
##D observations = readOGR(rpath,"observations")
##D # Create a column with the specific runoff:
##D observations$obs = observations$QSUMMER_OB/observations$AREASQKM
##D 
##D vario = rtopVariogram(observations, cloud = TRUE)
## End(Not run)



