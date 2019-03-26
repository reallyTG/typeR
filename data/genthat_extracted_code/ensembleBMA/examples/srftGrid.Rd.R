library(ensembleBMA)


### Name: srftGrid
### Title: Gridded Surface Temperature Ensemble Forecasts
### Aliases: srftGrid
### Keywords: datasets

### ** Examples

## Not run: 
##D  # R check
##D   data(srft)
##D   data(srftGrid)
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
##D 
##D 
##D   srftGridData <- ensembleData( forecasts = srftGrid[ ,labels],
##D                                 latitude = srftGrid$lat,
##D                                 longitude = srftGrid$lon,
##D                                 forecastHour = 48,
##D                                 initializationTime = "00")
##D 
##D    CRPS( srtGridData, srftFit)
## End(Not run)


