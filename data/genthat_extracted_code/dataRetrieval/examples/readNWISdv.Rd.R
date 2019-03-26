library(dataRetrieval)


### Name: readNWISdv
### Title: Daily Value USGS NWIS Data Retrieval
### Aliases: readNWISdv
### Keywords: USGS data import service web

### ** Examples

site_id <- '04085427'
startDate <- '2012-01-01'
endDate <- '2012-06-30'
pCode <- '00060'
## Not run: 
##D rawDailyQ <- readNWISdv(site_id,pCode, startDate, endDate)
##D rawDailyQAndTempMeanMax <- readNWISdv(site_id,c('00010','00060'),
##D        startDate, endDate, statCd=c('00001','00003'))
##D rawDailyQAndTempMeanMax <- renameNWISColumns(rawDailyQAndTempMeanMax)
##D rawDailyMultiSites<- readNWISdv(c("01491000","01645000"),c('00010','00060'),
##D        startDate, endDate, statCd=c('00001','00003'))
##D # Site with no data:
##D x <- readNWISdv("10258500","00060", "2014-09-08", "2014-09-14")
##D names(attributes(x))
##D attr(x, "siteInfo")
##D attr(x, "variableInfo")
##D 
##D site <- "05212700"
##D notActive <- readNWISdv(site, "00060", "2014-01-01","2014-01-07")
## End(Not run)



