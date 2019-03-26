library(sirad)


### Name: hauto
### Title: Auto-calibrate Hargreaves model
### Aliases: hauto

### ** Examples

data(Metdata)
Tmax <- Metdata$meteo$TEMP_MAX
Tmin <- Metdata$meteo$TEMP_MIN
days <- Metdata$meteo$DAY
lat <- Metdata$LATITUDE
lon <- Metdata$LONGITUDE
hauto(lat,lon,days,extraT=NULL,Tmax,Tmin,tal=0.76)



