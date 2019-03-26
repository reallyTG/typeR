library(ensembleBMA)


### Name: prcpFit
### Title: BMA Model Fit to Precipitation Data
### Aliases: prcpFit
### Keywords: data

### ** Examples

## Not run: 
##D  # R check
##D 
##D   data(prcpFit)
##D 
##D   modelParameters(prcpFit, date = "20030113")
##D 
##D   data(prcpGrid) 
##D 
##D   prcpGridData <- ensembleData(forecasts = prcpGrid[,1:9], 
##D                                latitude = prcpGrid[,"latitude"],
##D                                longitude = prcpGrid[,"longitude"],
##D                                forecsatHour = 48,
##D                                initializationTime = "00")
##D 
##D # probability of precipitation
##D   1 - cdf( prcpFit, prcpGridData, value = 0)
##D 
##D # probability of precipitation above 0.25 in
##D   1 - cdf( prcpFit, prcpGridData, date = "20030115", value = 25)
##D   
## End(Not run)


