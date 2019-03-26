library(dataRetrieval)


### Name: addWaterYear
### Title: add a water year column
### Aliases: addWaterYear

### ** Examples

## Not run: 
##D  
##D dataTemp <- readNWISdata(stateCd="OH",parameterCd="00010", service="dv")
##D dataTemp <- addWaterYear(dataTemp)
##D 
##D pHData <- readWQPdata(siteid="USGS-04024315",characteristicName="pH")
##D pHData <- addWaterYear(pHData)
## End(Not run)



