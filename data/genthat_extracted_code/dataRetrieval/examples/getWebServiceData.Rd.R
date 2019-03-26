library(dataRetrieval)


### Name: getWebServiceData
### Title: Function to return data from web services
### Aliases: getWebServiceData

### ** Examples

siteNumber <- "02177000"
startDate <- "2012-09-01"
endDate <- "2012-10-01"
offering <- '00003'
property <- '00060'
obs_url <- constructNWISURL(siteNumber,property,startDate,endDate,'dv')
## Not run: 
##D rawData <- getWebServiceData(obs_url)
## End(Not run)



