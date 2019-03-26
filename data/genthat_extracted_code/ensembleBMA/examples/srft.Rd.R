library(ensembleBMA)


### Name: srft
### Title: Surface Temperature Ensemble Forecasts and Observations
### Aliases: srft
### Keywords: datasets

### ** Examples

## Not run: 
##D  # R check
##D 
##D   data(srft)
##D 
##D   labels <- c("CMCG","ETA","GASP","GFS","JMA","NGPS","TCWB","UKMO")
##D 
##D   srftData <- ensembleData( forecasts = srft[ ,labels],
##D                             dates = srft$date,
##D                             observations = srft$obs,
##D                             latitude = srft$lat,
##D                             longitude = srft$lon,
##D                             forecastHour = 48,
##D                             initializationTime = "00")
##D 
##D   srftFit <- ensembleBMAnormal( srftData, date = "2004013100",
##D                                 trainingDays = 25)
## End(Not run)


