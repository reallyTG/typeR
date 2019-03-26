library(HelpersMG)


### Name: tide.info
### Title: Annual tide calendar for one particular location
### Aliases: tide.info
### Keywords: Tide

### ** Examples

## Not run: 
##D library("HelpersMG")
##D lat <- 5.74
##D long <- -54
##D Awala2004 <- tide.info(year=2004, longitude=long, latitude=lat, tz="America/Cayenne")
##D with(Awala2004, plot(Date.Time, Level, bty="n", las=1, type="l", 
##D xlab=paste("Year", as.POSIXlt(Date.Time[1])$year+1900), 
##D ylab="Tide level in m"))
## End(Not run)



