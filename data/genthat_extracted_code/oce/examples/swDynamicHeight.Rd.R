library(oce)


### Name: swDynamicHeight
### Title: Dynamic height of seawater profile
### Aliases: swDynamicHeight

### ** Examples

## Not run: 
##D library(oce)
##D data(section)
##D 
##D # Dynamic height and geostrophy
##D par(mfcol=c(2,2))
##D par(mar=c(4.5,4.5,2,1))
##D 
##D # Left-hand column: whole section
##D # (The smoothing lowers Gulf Stream speed greatly)
##D westToEast <- subset(section, 1<=stationId&stationId<=123)
##D dh <- swDynamicHeight(westToEast)
##D plot(dh$distance, dh$height, type='p', xlab="", ylab="dyn. height [m]")
##D ok <- !is.na(dh$height)
##D smu <- supsmu(dh$distance, dh$height)
##D lines(smu, col="blue")
##D f <- coriolis(section[["station", 1]][["latitude"]])
##D g <- gravity(section[["station", 1]][["latitude"]])
##D v <- diff(smu$y)/diff(smu$x) * g / f / 1e3 # 1e3 converts to m
##D plot(smu$x[-1], v, type='l', col="blue", xlab="distance [km]", ylab="velocity [m/s]")
##D 
##D # right-hand column: gulf stream region, unsmoothed
##D gs <- subset(section, 102<=stationId&stationId<=124)
##D dh.gs <- swDynamicHeight(gs)
##D plot(dh.gs$distance, dh.gs$height, type='b', xlab="", ylab="dyn. height [m]")
##D v <- diff(dh.gs$height)/diff(dh.gs$distance) * g / f / 1e3
##D plot(dh.gs$distance[-1], v, type='l', col="blue",
##D   xlab="distance [km]", ylab="velocity [m/s]")
## End(Not run)




