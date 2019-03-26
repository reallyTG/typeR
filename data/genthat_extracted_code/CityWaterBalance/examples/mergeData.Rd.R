library(CityWaterBalance)


### Name: mergeData
### Title: Merge data sources into input for CityWaterBalance
### Aliases: mergeData

### ** Examples

## Not run: 
##D start <- "2010-01-01"
##D end <- "2010-12-31"
##D area <- 2707
##D atm <- getAtmoFlows(start, end, 'sample:Counties', 'STATE', 'RI', 41.5801)
##D inflow <- getStreamflow(start, end, c("01112500"))
##D inflow <- combineStreamflow(inflow, c(1))
##D outflow <- getStreamflow(start, end, c("01113895", "01114000", "01117000",
##D "01118500"))
##D outflow <- combineStreamflow(outflow, c(1, 1, 1, 1))
##D wu <- getWaterUse(c('RI'), 'ALL')
##D wu <- combineWaterUse(start, end, wu)
##D data <- mergeData(area, atm, inflow, outflow, wu)
## End(Not run)



