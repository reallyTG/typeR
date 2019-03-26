library(sirad)


### Name: su
### Title: Supit-Van Kappel solar radiation model
### Aliases: su

### ** Examples

require(zoo)
data(Metdata)
tmax <- Metdata$meteo$TEMP_MAX
tmin <- Metdata$meteo$TEMP_MIN
cc <- Metdata$meteo$CLOUD_DAYTIME_TOTAL
days <- Metdata$meteo$DAY
lat <- Metdata$LATITUDE
lon <- Metdata$LONGITUDE
plot(zoo(su(days=days, lat=lat, lon=lon, extraT=NULL, A=NA, B=NA, 
C=-NA, tmax=tmax, tmin=tmin, CC=cc),order.by=days))



