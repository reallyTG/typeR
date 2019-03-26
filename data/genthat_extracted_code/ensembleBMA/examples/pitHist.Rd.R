library(ensembleBMA)


### Name: pitHist
### Title: PIT Histogram
### Aliases: pitHist
### Keywords: models

### ** Examples

  data(srft)

  labels <- c("CMCG","ETA","GASP","GFS","JMA","NGPS","TCWB","UKMO")

  srftData <- ensembleData( forecasts = srft[ ,labels],
                            dates = srft$date,
                            observations = srft$obs,
                            latitude = srft$lat,
                            longitude = srft$lon,
                            forecastHour = 48,
                            initializationTime = "00")


## Not run: 
##D # this takes time
##D # the PIT should be evaluated over relatively long periods 
##D 
##D   srftFITall <- ensembleBMA( srftData, model = "normal", trainingDays = 25)
##D 
##D   srftPIT <- pitHist( srftFITall, srftData)
## End(Not run)



