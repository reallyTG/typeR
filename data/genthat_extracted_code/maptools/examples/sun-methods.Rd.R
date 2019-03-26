library(maptools)


### Name: sun-methods
### Title: Methods for sun ephemerides calculations
### Aliases: crepuscule sunriset solarnoon solarpos crepuscule-methods
###   crepuscule,SpatialPoints,POSIXct-method
###   crepuscule,matrix,POSIXct-method solarnoon-methods
###   solarnoon,SpatialPoints,POSIXct-method
###   solarnoon,matrix,POSIXct-method solarpos-methods
###   solarpos,SpatialPoints,POSIXct-method solarpos,matrix,POSIXct-method
###   sunriset-methods sunriset,SpatialPoints,POSIXct-method
###   sunriset,matrix,POSIXct-method
### Keywords: methods manip utilities

### ** Examples

## Location of Helsinki, Finland, in decimal degrees,
## as listed in NOAA's website
hels <- matrix(c(24.97, 60.17), nrow=1)
Hels <- SpatialPoints(hels, proj4string=CRS("+proj=longlat +datum=WGS84"))
d041224 <- as.POSIXct("2004-12-24", tz="EET")
## Astronomical dawn
crepuscule(hels, d041224, solarDep=18, direction="dawn", POSIXct.out=TRUE)
crepuscule(Hels, d041224, solarDep=18, direction="dawn", POSIXct.out=TRUE)
## Nautical dawn
crepuscule(hels, d041224, solarDep=12, direction="dawn", POSIXct.out=TRUE)
crepuscule(Hels, d041224, solarDep=12, direction="dawn", POSIXct.out=TRUE)
## Civil dawn
crepuscule(hels, d041224, solarDep=6, direction="dawn", POSIXct.out=TRUE)
crepuscule(Hels, d041224, solarDep=6, direction="dawn", POSIXct.out=TRUE)
solarnoon(hels, d041224, POSIXct.out=TRUE)
solarnoon(Hels, d041224, POSIXct.out=TRUE)
solarpos(hels, as.POSIXct(Sys.time(), tz="EET"))
solarpos(Hels, as.POSIXct(Sys.time(), tz="EET"))
sunriset(hels, d041224, direction="sunrise", POSIXct.out=TRUE)
sunriset(Hels, d041224, direction="sunrise", POSIXct.out=TRUE)
## Using a sequence of dates
Hels_seq <- seq(from=d041224, length.out=365, by="days")
up <- sunriset(Hels, Hels_seq, direction="sunrise", POSIXct.out=TRUE)
down <- sunriset(Hels, Hels_seq, direction="sunset", POSIXct.out=TRUE)
day_length <- down$time - up$time
plot(Hels_seq, day_length, type="l")

## Using a grid of spatial points for the same point in time
## Not run: 
##D grd <- GridTopology(c(-179,-89), c(1,1), c(359,179))
##D SP <- SpatialPoints(coordinates(grd),
##D                     proj4string=CRS("+proj=longlat +datum=WGS84"))
##D wint <- as.POSIXct("2004-12-21", tz="GMT")
##D win <- crepuscule(SP, wint, solarDep=6, direction="dawn")
##D SPDF <- SpatialGridDataFrame(grd,
##D  proj4string=CRS("+proj=longlat +datum=WGS84"),
##D  data=data.frame(winter=win))
##D image(SPDF, axes=TRUE, col=cm.colors(40))
## End(Not run)



