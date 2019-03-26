library(rtop)


### Name: rtopFitVariogram
### Title: Fit variogram model to sample variogram of data with spatial
###   support
### Aliases: rtopFitVariogram rtopFitVariogram.rtop
###   rtopFitVariogram.SpatialPolygonsDataFrame
###   rtopFitVariogram.SpatialPointsDataFrame
###   rtopFitVariogram.rtopVariogram rtopFitVariogram.rtopVariogramCloud
### Keywords: spatial

### ** Examples

## Not run: 
##D library(rgdal)
##D rpath = system.file("extdata",package="rtop")
##D observations = readOGR(rpath,"observations")
##D # Create a column with the specific runoff:
##D observations$obs = observations$QSUMMER_OB/observations$AREASQKM
##D predictionLocations = readOGR(rpath,"predictionLocations")
##D 
##D # Setting some parameters 
##D params = list(gDist = TRUE, cloud = FALSE)
##D # Create a column with the specific runoff:
##D observations$obs = observations$QSUMMER_OB/observations$AREASQKM
##D # Build an object
##D rtopObj = createRtopObject(observations,predictionLocations, 
##D                            params = params)
##D # Fit a variogram (function also creates it)
##D rtopObj = rtopFitVariogram(rtopObj)
##D rtopObj$variogramModel
## End(Not run)



