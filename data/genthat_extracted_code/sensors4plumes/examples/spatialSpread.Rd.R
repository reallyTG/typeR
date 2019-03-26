library(sensors4plumes)


### Name: spatialSpread
### Title: Cost function based on sensor locations only
### Aliases: spatialSpread

### ** Examples

# prepare data and functions
data(radioactivePlumes)
data(medianVariogram)

krigingVarianceMedian = 
  replaceDefault(krigingVariance, newDefaults = list(model = medianVariogram))[["fun"]]

meanFun = function(x){mean(x, na.rm = TRUE)}

locationsSensors = sample.int(nLocations(radioactivePlumes), 50)

spatialSpread_minDist = spatialSpread(
    simulations = radioactivePlumes,
    locations = locationsSensors, 
    weightByArea = TRUE,
    fun = minimalDistance,
    fun_R = meanFun
)
spatialSpread_krigingVar = spatialSpread(
    simulations = radioactivePlumes,
    locations = locationsSensors, 
    weightByArea = TRUE,
    fun = krigingVarianceMedian,
    fun_R = meanFun
  )

# plot maps
## Not run: 
##D ## takes some seconds
##D y = radioactivePlumes@locations
##D y@data$minDist = spatialSpread_minDist[["costLocations"]]
##D y@data$krigVar = spatialSpread_krigingVar[["costLocations"]]
##D yPoints = as(y, "SpatialPointsDataFrame")
##D 
##D # distance to next sensor
##D spplot(y, zcol = "minDist", 
##D        sp.layout = list("sp.points", yPoints[locationsSensors,], 
##D                           col = 3))
##D # kriging variance
##D spplot(y, zcol = "krigVar", 
##D        sp.layout = list("sp.points", yPoints[locationsSensors,], 
##D                           col = 3))
## End(Not run)



