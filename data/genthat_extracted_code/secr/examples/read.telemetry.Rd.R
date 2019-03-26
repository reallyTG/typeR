library(secr)


### Name: read.telemetry
### Title: Import Telemetry Fixes
### Aliases: read.telemetry
### Keywords: IO

### ** Examples


## Not run: 
##D setwd('D:/bears/alberta')
##D ## peek at raw data
##D head(readLines('gps2008.txt'))
##D gps2008CH <- read.telemetry("gps2008.txt")
##D plot( gps2008CH, gridsp = 10000)
##D head(gps2008CH)
##D secr.fit(gps2008CH, start = log(4000), detectfn = 'HHN', 
##D     details = list(telemetryscale = 1e12))
## End(Not run)




