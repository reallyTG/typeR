library(EventDetectR)


### Name: buildEDModel
### Title: build Event Detection Model
### Aliases: buildEDModel

### ** Examples


## build a simple event detection model with standard configuration
x <- stationBData[1:2000,-1]
buildEDModel(x)

## Set up a more complex event detection model defining some additional configuration
buildEDModel(x, dataPrepators = "ImputeTSMean", buildModelAlgo = "ForecastArima")



