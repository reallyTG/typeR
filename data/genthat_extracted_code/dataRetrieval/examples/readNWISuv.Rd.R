library(dataRetrieval)


### Name: readNWISuv
### Title: Instantaneous value data retrieval from USGS (NWIS)
### Aliases: readNWISuv
### Keywords: USGS data import service web

### ** Examples

site_id <- '05114000'
parameterCd <- '00060'
startDate <- "2014-10-10"
endDate <- "2014-10-10"
## Not run: 
##D rawData <- readNWISuv(site_id,parameterCd,startDate,endDate)
##D 
##D rawData_today <- readNWISuv(site_id, parameterCd, Sys.Date(),Sys.Date())
##D 
##D timeZoneChange <- readNWISuv(c('04024430','04024000'),parameterCd,
##D          "2013-11-03","2013-11-03")
##D  
##D centralTime <- readNWISuv(site_id,parameterCd,
##D                            "2014-10-10T12:00", "2014-10-10T23:59",
##D                            tz="America/Chicago")
##D 
##D # Adding 'Z' to the time indicates to the web service to call the data with UTC time:
##D GMTdata <- readNWISuv(site_id,parameterCd,
##D                            "2014-10-10T00:00Z", "2014-10-10T23:59Z")
## End(Not run)




