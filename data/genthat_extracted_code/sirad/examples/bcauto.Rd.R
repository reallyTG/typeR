library(sirad)


### Name: bcauto
### Title: Auto-calibrate Bristow-Campbell model
### Aliases: bcauto

### ** Examples

data(Metdata)
tmax <- Metdata$meteo$TEMP_MAX
tmin <- Metdata$meteo$TEMP_MIN
days <- Metdata$meteo$DAY
lat <- Metdata$LATITUDE
lon <- Metdata$LONGITUDE
rad_mea <- Metdata$meteo$RAD_MEA
dcoast <- Metdata$DCOAST

bcauto(lat,lon,days,extraT=NULL,tmax,tmin,perce=NA,dcoast)



