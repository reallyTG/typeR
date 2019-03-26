library(sirad)


### Name: ha
### Title: Hargreaves solar radiation model
### Aliases: ha

### ** Examples

require(zoo)
data(Metdata)
tmax <- Metdata$meteo$TEMP_MAX
tmin <- Metdata$meteo$TEMP_MIN
days <- Metdata$meteo$DAY
lat <- Metdata$LATITUDE
lon <- Metdata$LONGITUDE
plot(zoo(ha(days, lat, lon, extraT=NULL, A=NA, B=NA, Tmax=tmax, Tmin=tmin),order.by=days))



