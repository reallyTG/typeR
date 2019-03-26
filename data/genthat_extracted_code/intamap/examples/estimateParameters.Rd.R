library(intamap)


### Name: estimateParameters
### Title: Automatic estimation of correlation structure parameters
### Aliases: estimateParameters estimateParameters.automap
###   estimateParameters.copula estimateParameters.default
###   estimateParameters.idw estimateParameters.linearVariogram
###   estimateParameters.transGaussian estimateParameters.yamamoto
### Keywords: spatial

### ** Examples

set.seed(13131)

# set up data:
data(meuse)
coordinates(meuse) = ~x+y
meuse$value = log(meuse$zinc)
data(meuse.grid)
gridded(meuse.grid) = ~x+y
proj4string(meuse) = CRS("+init=epsg:28992")
proj4string(meuse.grid) = CRS("+init=epsg:28992")

# set up intamap object:
idwObject = createIntamapObject(
	observations = meuse,
	formulaString=as.formula(zinc~1),
  predictionLocations = meuse.grid,
	class = "idw"
)

# run test:
checkSetup(idwObject)

# do interpolation steps:
idwObject = estimateParameters(idwObject, idpRange = seq(0.25,2.75,.25),
                               nfold=3) # faster
idwObject$inverseDistancePower



