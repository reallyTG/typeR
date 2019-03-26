library(solaR)


### Name: C_local2Solar
### Title: Local time, mean solar time and UTC time zone.
### Aliases: local2Solar CBIND lonHH
### Keywords: utilities

### ** Examples

t.local<-as.POSIXct("2006-01-08 10:07:52", tz='Europe/Madrid')

##The local time zone and the location have the same longitude (15 degrees)
local2Solar(t.local)
##But Madrid is at lon=-3
local2Solar(t.local, lon=-3)

##Daylight saving time
t.local.dst<-as.POSIXct("2006-07-08 10:07:52", tz='Europe/Madrid')

local2Solar(t.local.dst)
local2Solar(t.local.dst, lon=-3)

## Not run: 
##D ##Extracted from an example of calcG0
##D ##NREL-MIDC
##D ##La Ola, Lanai
##D ##Latitude: 20.76685o North
##D ##Longitude: 156.92291o West
##D ##Time Zone: -10.0
##D 
##D NRELurl <- 'http://goo.gl/fFEBN'
##D 
##D dat <- read.table(NRELurl, header=TRUE, sep=',')
##D names(dat) <- c('date', 'hour', 'G0', 'B', 'D0', 'Ta')
##D 
##D ##B is direct normal. We need direct horizontal.
##D dat$B0 <- dat$G0-dat$D0
##D 
##D ##http://www.nrel.gov/midc/la_ola_lanai/instruments.html:
##D ##The datalogger program runs using Greenwich Mean Time (GMT),
##D ##data is converted to Hawaiin Standard Time (HST) after data collection
##D idxLocal <- with(dat, as.POSIXct(paste(date, hour), format='%m/%d/%Y %H:%M', tz='HST'))
##D head(idxLocal)
##D idx <- local2Solar(idxLocal, lon=-156.9339)
##D head(idx)
## End(Not run)



