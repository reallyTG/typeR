library(rtop)


### Name: rtopKrige
### Title: Spatial interpolation of data with spatial support
### Aliases: rtopKrige rtopKrige.rtop rtopKrige.SpatialPolygonsDataFrame
###   rtopKrige.STSDF rtopKrige.default
### Keywords: spatial

### ** Examples

## Not run: 
##D library(rgdal)
##D # The following command will download  the complete example data set
##D # downloadRtopExampleData() 
##D # observations$obs = observations$QSUMMER_OB/observations$AREASQKM
##D 
##D rpath = system.file("extdata",package="rtop")
##D observations = readOGR(rpath,"observations")
##D predictionLocations = readOGR(rpath,"predictionLocations")
##D 
##D # Setting some parameters; nclus > 1 will start a cluster with nclus 
##D # workers for parallel processing
##D params = list(gDist = TRUE, cloud = FALSE, nclus = 1, rresol = 25)
##D 
##D # Create a column with the specific runoff:
##D observations$obs = observations$QSUMMER_OB/observations$AREASQKM
##D 
##D # Build an object
##D rtopObj = createRtopObject(observations, predictionLocations, 
##D            params = params)
##D 
##D # Fit a variogram (function also creates it)
##D rtopObj = rtopFitVariogram(rtopObj)
##D 
##D # Predicting at prediction locations
##D rtopObj = rtopKrige(rtopObj)
##D 
##D # Cross-validation
##D rtopObj = rtopKrige(rtopObj,cv=TRUE)
##D cor(rtopObj$predictions$observed,rtopObj$predictions$var1.pred)
## End(Not run)



