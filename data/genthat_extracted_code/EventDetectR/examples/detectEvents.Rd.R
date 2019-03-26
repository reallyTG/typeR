library(EventDetectR)


### Name: detectEvents
### Title: detectEvents in a given data.frame
### Aliases: detectEvents

### ** Examples

## Run event detection with default settings:
def <- detectEvents(x = stationBData[1:100,-1])

## No test: 
## Only refit the model after every 50th new datapoint,
## have someoutput with verbosityLevel = 2 and ignore
## the variance warning
ed <- detectEvents(stationBData[1000:2000,-1],nIterationsRefit = 50,
                   verbosityLevel = 2,ignoreVarianceWarning = TRUE)

## Switch to another model: Arima
ed2 <- detectEvents(stationBData[1000:2000,-1],nIterationsRefit = 50,
                    verbosityLevel = 2,ignoreVarianceWarning = TRUE,
                    buildModelAlgo = "ForecastArima")
## End(No test)



