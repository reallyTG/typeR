library(ensembleBMA)


### Name: prcpGrid
### Title: Gridded Ensemble Forecasts of Precipitation
### Aliases: prcpGrid
### Keywords: data

### ** Examples

## Not run: 
##D  # R check
##D 
##D   data(prcpGrid) 
##D 
##D   prcpGridData <- ensembleData(forecasts = prcpGrid[,1:9], 
##D                                latitude = prcpGrid[,"latitude"],
##D                                longitude = prcpGrid[,"longitude"],
##D                                forecastHour = 48,
##D                                initilaizationTime = "00")
##D 
##D   data(prcpFit)
##D 
##D # median forecast for Jan 15, 2003 at the grid points
##D 
##D   quantileForecast( prcpFit, prcpGridData, date = "20030115")
##D   
## End(Not run)


