library(sirad)


### Name: sirad-package
### Title: Functions for calculating daily solar radiation and
###   evapotranspiration
### Aliases: sirad-package sirad
### Keywords: package

### ** Examples

require(zoo)
data(Metdata)
A <- 0.21
B <- 0.57
sunshine <- Metdata$meteo$SUNSHINE
days <- Metdata$meteo$DAY
lat <- Metdata$LATITUDE
lon <- Metdata$LONGITUDE
plot(zoo(ap(days=days,lat=lat,lon=lon,extraT=NULL, A=A,B=B,SSD=sunshine),order.by=days))



