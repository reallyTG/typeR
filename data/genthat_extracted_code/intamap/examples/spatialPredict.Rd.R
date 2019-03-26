library(intamap)


### Name: spatialPredict
### Title: Spatial prediction
### Aliases: spatialPredict spatialPredict.automap spatialPredict.copula
###   spatialPredict.default spatialPredict.idw
###   spatialPredict.linearVariogram spatialPredict.transGaussian
###   spatialPredict.yamamoto
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
	predictionLocations = meuse.grid,
	targetCRS = "+init=epsg:3035",
	params = getIntamapParams(),
	class = "linearVariogram"
)

# do interpolation step:
obj = spatialPredict(obj)  # spatialPredict.linearVariogram



