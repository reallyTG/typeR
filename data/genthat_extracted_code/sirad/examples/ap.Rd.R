library(sirad)


### Name: ap
### Title: Angstrom-Prescott solar radiation model
### Aliases: ap

### ** Examples


require(zoo)
#A <- 0.21
#B <- 0.57
sunshine <- Metdata$meteo$SUNSHINE
days <- Metdata$meteo$DAY
lat <- Metdata$LATITUDE
lon <- Metdata$LONGITUDE
plot(zoo(ap(days,lat,lon, extraT=NULL,A=NA,B=NA,sunshine),order.by=days))



