library(dataRetrieval)


### Name: whatNWISdata
### Title: USGS data availability
### Aliases: whatNWISdata
### Keywords: USGS data import service web

### ** Examples

## Not run: 
##D availableData <- whatNWISdata(siteNumber = '05114000')
##D # To find just unit value ('instantaneous') data:
##D uvData <- whatNWISdata(siteNumber = '05114000',service="uv")
##D uvDataMulti <- whatNWISdata(siteNumber = c('05114000','09423350'),service=c("uv","dv"))
##D flowAndTemp <- whatNWISdata(stateCd = "WI", service = "uv", 
##D                              parameterCd = c("00060","00010"),
##D                              statCd = "00003")
## End(Not run)



