library(GeoLight)


### Name: hoopoe2
### Title: Sunrise and sunset times: From light intensity measurement
###   (hoopoe1)
### Aliases: hoopoe2

### ** Examples

data(hoopoe2)
 hoopoe2$tFirst <- as.POSIXct(hoopoe2$tFirst, tz = "GMT")
 hoopoe2$tSecond <- as.POSIXct(hoopoe2$tSecond, tz = "GMT")
coord <- coord(hoopoe2, degElevation=-6)
## plot in a map using package maps
# par(oma=c(5,0,0,0))
# map(xlim=c(-20,40),ylim=c(-10,60),interior=F,col="darkgrey")
# map(xlim=c(-20,40),ylim=c(-10,60),boundary=F,lty=2,col="darkgrey",add=T)
# mtext(c("Longitude (degrees)","Latitude (degrees)"),side=c(1,2),line=c(2.2,2.5),font=3)
# map.axes()
# points(coord,col="brown",cex=0.5,pch=20)



