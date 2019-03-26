library(maptools)


### Name: readGPS
### Title: GPSbabel read interface
### Aliases: readGPS
### Keywords: spatial

### ** Examples

## Not run: 
##D #b1 <- readGPS(f="usb:")
##D #str(b1)
##D #b2 <- b1[1:172,]
##D #wp0 <- b2[,c(2,3,4,8,9,19)]
##D #str(wp0)
##D #wp0$long <- wp0$V9
##D #wp0$lat <- as.numeric(as.character(wp0$V8))
##D #wp0$id <- as.character(wp0$V2)
##D #wp0$alt <- as.numeric(substring(as.character(wp0$V19), 1,
##D # (nchar(as.character(wp0$V19))-1)))
##D #wp0$time <- as.POSIXct(strptime(paste(as.character(wp0$V3),
##D # as.character(wp0$V4)), format="%d-%b-%y %H:%M:%S"))
##D #str(wp0)
##D #wp1 <- wp0[,-(1:6)]
##D #str(wp1)
##D #summary(wp1)
## End(Not run)



