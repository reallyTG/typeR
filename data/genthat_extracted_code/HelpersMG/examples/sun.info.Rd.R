library(HelpersMG)


### Name: sun.info
### Title: Estimate the time of sunrise and sunset according to longitude,
###   latitude and date
### Aliases: sun.info

### ** Examples

## Not run: 
##D # Generate a timeserie of time
##D date <- seq(from=as.Date("2000-01-01"), to=as.Date("2000-12-31"), by="1 day")
##D plot(date, sun.info(date, latitude=23, longitude=0)$day.length, bty="n", 
##D  las=1, type="l", xlab="Ordinal days", ylab="Day length in hours")
##D plot(date, sun.info(date, latitude=23, longitude=0)$sunrise, bty="n", 
##D  las=1, type="l", xlab="Ordinal days", ylab="Sun rise in hours")
## End(Not run)



