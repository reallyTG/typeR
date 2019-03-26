library(sirad)


### Name: bc
### Title: Bristow-Campbell model
### Aliases: bc

### ** Examples

require(zoo)
data(Metdata)
B <- 0.11
tmax <- Metdata$meteo$TEMP_MAX
tmin <- Metdata$meteo$TEMP_MIN
days <- Metdata$meteo$DAY
lat <- Metdata$LATITUDE
plot(zoo(bc(days, lat, BCb=B,extraT=NULL, tmax, tmin, BCc=2, tal=0.76),order.by=days))



