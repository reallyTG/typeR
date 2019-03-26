library(EGRET)


### Name: mergeReport
### Title: mergeReport
### Aliases: mergeReport
### Keywords: USGS WRTDS data import

### ** Examples


siteNumber <- '01491000'
pCode <- '00631'
## Not run: 
##D Daily <- readNWISDaily(siteNumber,'00060', '1984-10-01', '')
##D Sample <- readNWISSample(siteNumber,pCode, '1984-10-01', '')
##D INFO <- readNWISInfo(siteNumber,pCode,interactive=FALSE)
##D eList <- mergeReport(INFO, Daily, Sample)
##D Sample <- eList$Sample
##D plot(eList)
##D 
##D # Create eList with no water quality data:
##D 
##D eList <- mergeReport(INFO, Daily, Sample = NA)
##D plotFour(eList)
## End(Not run)



