library(intamap)


### Name: blockPredict
### Title: Spatial block prediction
### Aliases: blockPredict spatialPredict.block
### Keywords: spatial

### ** Examples

# This example skips some steps that might be necessary for more complicated
# tasks, such as estimateParameters and pre- and postProcessing of the data
data(meuse)
coordinates(meuse) = ~x+y
meuse$value = log(meuse$zinc)
data(meuse.grid)
gridded(meuse.grid) = ~x+y
proj4string(meuse) = CRS("+init=epsg:28992")
proj4string(meuse.grid) = CRS("+init=epsg:28992")

# set up intamap object:
obj = createIntamapObject(
	observations = meuse,
	predictionLocations = meuse.grid[sample(1:length(meuse.grid),10),],
# Prediction for a different projection possible if rgdal is available
	targetCRS = ifelse(require(rgdal), "+init=epsg:3035", "+init=epsg:28992"),
	class = "automap"
)

# do interpolation step:
obj = conformProjections(obj)
obj = estimateParameters(obj) 
obj = blockPredict(obj,block=c(100,100))  # blockPredict


# intamap object for which simulation is needed:
meuse$value = meuse$zinc
obj = createIntamapObject(
	observations = meuse,
	predictionLocations = meuse.grid[sample(1:length(meuse.grid),5),],
	params = list(ngrid = 16),
  class = "transGaussian"  # trans-Gaussian kriging method
)
obj = estimateParameters(obj, lambda = 0)  # lambda is optional, lambda = 0 gives lognormal kriging
obj = blockPredict(obj,block=c(100,100))  # blockPredict



