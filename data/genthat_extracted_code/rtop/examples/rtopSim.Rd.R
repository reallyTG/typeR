library(rtop)


### Name: rtopSim
### Title: Spatial simulation of data with spatial support
### Aliases: rtopSim rtopSim.rtop rtopSim.default
### Keywords: spatial

### ** Examples

## Not run: 
##D library(rgdal)
##D # The following command will download  the complete example data set
##D # downloadRtopExampleData() 
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
##D                            params = params)
##D 
##D # Fit a variogram (function also creates it)
##D rtopObj = rtopFitVariogram(rtopObj)
##D 
##D # Conditional simulations for two new locations 
##D rtopObj10 = rtopSim(rtopObj, nsim = 5)
##D rtopObj11 = rtopObj
##D 
##D # Unconditional simulation at the observation locations
##D # (These are moved to the predictionLocations)
##D rtopObj11$predictionLocations = rtopObj11$observations
##D rtopObj11$observations = NULL
##D # Setting varMatUpdate to TRUE, to make sure that covariance
##D # matrices are recomputed
##D rtopObj12 = rtopSim(rtopObj11, nsim = 10, beta = 0.01, 
##D                     varMatUpdate = TRUE)
##D 
##D rtopObj10$simulations@data
##D rtopObj12$simulations@data
##D 
## End(Not run)



