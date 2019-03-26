library(HARModel)


### Name: HARforecast
### Title: HAR forecasting
### Aliases: HARforecast
### Keywords: HAR forecast

### ** Examples

## Not run: 
##D set.seed(123)
##D #Simulate a HAR process:
##D HARSim = HARsimulate(iLength = 10000 , iBurnin = 1000,
##D vLags = c(1,5,22), vCoef = c(0.5, 0.36 , 0.28 , 0.28 ))
##D #Do 200 rolling forecasts each of length 200 on the simulated process:
##D HARForecast = HARforecast(vRealizedMeasure = HARSim@Simulation , 
##D vLags = c(1, 5, 22), iNRoll = 200 , iNAhead = 200)
##D #Plot the forecast:
##D plot(HARForecast)
## End(Not run)



