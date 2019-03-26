library(rtop)


### Name: createRtopObject
### Title: Create an object for interpolation within the rtop package
### Aliases: createRtopObject
### Keywords: spatial

### ** Examples

 ## Not run: 
library(rgdal)
rpath = system.file("extdata",package="rtop")
observations = readOGR(rpath,"observations")
# Create a column with the specific runoff:
observations$obs = observations$QSUMMER_OB/observations$AREASQKM
predictionLocations = readOGR(rpath,"predictionLocations")

# Setting some parameters 
params = list(gDist = TRUE, cloud = FALSE)
# Create a column with the specific runoff:
observations$obs = observations$QSUMMER_OB/observations$AREASQKM
# Build an object
rtopObj = createRtopObject(observations, predictionLocations, 
                           params = params)

## End(Not run)




