library(sirad)


### Name: mh
### Title: Mahmood-Hubbard solar radiation model
### Aliases: mh

### ** Examples

require(zoo)
data(Metdata)
tmax <- Metdata$meteo$TEMP_MAX
tmin <- Metdata$meteo$TEMP_MIN
days <- Metdata$meteo$DAY
lat <- Metdata$LATITUDE
plot(zoo(mh(days=days, lat=lat, Tmax=tmax, Tmin=tmin),order.by=days))




