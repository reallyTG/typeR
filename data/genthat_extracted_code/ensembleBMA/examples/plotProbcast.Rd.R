library(ensembleBMA)


### Name: plotProbcast
### Title: Surface plots for forecast information.
### Aliases: plotProbcast binGrid
### Keywords: models

### ** Examples

  data(srft)

  labels <- c("CMCG","ETA","GASP","GFS","JMA","NGPS","TCWB","UKMO")

  srftData <- ensembleData( forecasts = srft[,labels],
                            dates = srft$date, observations = srft$obs,
                            latitude = srft$lat, longitude = srft$lon,
                            forecastHour = 48, initializationTime = "00")

## Not run: 
##D  # R check
##D 
##D   bmaFit <- ensembleBMA( srftData, date = "2004012900", trainingDays = 25,
##D                          model = "normal")
##D 
##D   bmaForc <- quantileForecast( bmaFit, srftData, date = "2004012900",  
##D                                   quantiles = c(.1, .5, .9))
##D 
##D   obs <- srftData$date == "2004012900"
##D   lat <- srftData$latitude[obs]
##D   lon <- srftData$longitude[obs]
##D 
##D   plotProbcast( bmaForc[,"0.5"], lat, lon, 
##D                    type = "contour", interpolate = TRUE)
##D   title("Median Forecast")
##D 
##D   plotProbcast( srftData$obs[obs], lat, lon, 
##D                   type = "contour", interpolate = TRUE)
##D   title("Observed Surface Temperature")
##D 
##D   data(srftGrid)
##D 
##D   memberLabels <- c("CMCG","ETA","GASP","GFS","JMA","NGPS","TCWB","UKMO")
##D  
##D   srftGridData <- ensembleData(forecasts = srftGrid[,memberLabels],
##D       latitude = srftGrid[,"latitude"], longitude = srftGrid[,"longitude"],
##D                             forecastHour = 48, initializationTime = "00")
##D 
##D   gridForc <- quantileForecast( bmaFit, srftGridData, 
##D                     date = "2004021400", quantiles = c( .1, .5, .9))
##D 
##D   library(fields)
##D 
##D   plotProbcast(gridForc[,"0.5"],lon=srftGridData$lon,
##D      lat=srftGridData$lat,type="image",col=rev(rainbow(100,start=0,end=0.85)))
##D   title("Median Grid Forecast for Surface Temperature", cex = 0.5)
##D 
##D   probFreeze <- cdf( bmaFit, srftGridData,  date = "2004021400", 
##D                              value = 273.15)
##D 
##D   plotProbcast(probFreeze, lon=srftGridData$lon, lat=srftGridData$lat,
##D                    type="image",col=gray((32:0)/32))
##D   title("Probability of Freezing", cex = 0.5)
##D 
## End(Not run)


