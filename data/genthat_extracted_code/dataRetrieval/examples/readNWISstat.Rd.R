library(dataRetrieval)


### Name: readNWISstat
### Title: Site statistics retrieval from USGS (NWIS)
### Aliases: readNWISstat

### ** Examples

## Not run: 
##D x1 <- readNWISstat(siteNumbers=c("02319394"),
##D                   parameterCd=c("00060"),
##D                   statReportType="annual") 
##D 
##D #all the annual mean discharge data for two sites
##D x2 <- readNWISstat(siteNumbers=c("02319394","02171500"),
##D                   parameterCd=c("00010","00060"),
##D                   statReportType="annual")
##D 
##D #Request p25, p75, and mean values for temperature and discharge for the 2000s
##D #Note that p25 and p75 were not available for temperature, and return NAs
##D x <- readNWISstat(siteNumbers=c("02171500"),
##D                   parameterCd=c("00010","00060"),
##D                   statReportType="daily",
##D                   statType=c("mean","median"),
##D                   startDate="2000",endDate="2010")
## End(Not run)



