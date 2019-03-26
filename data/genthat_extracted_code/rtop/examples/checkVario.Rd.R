library(rtop)


### Name: checkVario
### Title: Plot variogram fitted to data with support
### Aliases: checkVario checkVario.rtop checkVario.rtopVariogramModel
### Keywords: spatial

### ** Examples

## Not run: 
##D library(rgdal)
##D library(gstat)
##D rpath = system.file("extdata",package="rtop")
##D setwd(rpath)
##D observations = readOGR(".","observations")
##D # Create a column with the specific runoff:
##D observations$obs = observations$QSUMMER_OB/observations$AREASQKM
##D predictionLocations = readOGR(".","predictionLocations")
##D params = list(cloud = TRUE, gDist = TRUE)
##D rtopObj = createRtopObject(observations, predictionLocations, 
##D                            params = params)
##D 
##D # Fit a variogram (function also creates it)
##D rtopObj = rtopFitVariogram(rtopObj)
##D checkVario(rtopObj, 
##D     compVar = list(first = vgm(5e-6, "Sph", 30000,5e-8), 
##D                    second = vgm(2e-6, "Sph", 30000,5e-8)))
##D 
##D rtopObj = checkVario(rtopObj, acor = 0.000001, 
##D           acomp = data.frame(acl1 = c(2,2,2,2,3,3,3,4,4), 
##D           acl2 = c(2,3,4,5,3,4,5,4,5)))
##D rtopObj = checkVario(rtopObj, cloud = TRUE, identify = TRUE, 
##D           acor = 0.000001)
## End(Not run)



