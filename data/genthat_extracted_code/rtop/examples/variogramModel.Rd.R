library(rtop)


### Name: variogramModel
### Title: create or update variogram model
### Aliases: rtopVariogramModel updateRtopVariogram
###   updateRtopVariogram.rtop updateRtopVariogram.rtopVariogramModel
### Keywords: spatial

### ** Examples

## Not run: 
##D library(rgdal)
##D rpath = system.file("extdata",package="rtop")
##D observations = readOGR(rpath,"observations")
##D # Create a column with the specific runoff:
##D observations$obs = observations$QSUMMER_OB/observations$AREASQKM
##D predictionLocations = readOGR(rpath,"predictionLocations")
##D rtopObj = createRtopObject(observations,predictionLocations)
##D  # Fit a variogram (function also creates it)
##D rtopObj = rtopFitVariogram(rtopObj)
##D rtopObj = updateRtopVariogram(rtopObj, exp = 1.5, action = "mult", 
##D               checkVario = TRUE)
## End(Not run)



