library(sirad)


### Name: hacal
### Title: Calibrate Hargreaves model
### Aliases: hacal

### ** Examples

data(Metdata)
tmax <- Metdata$meteo$TEMP_MAX
tmin <- Metdata$meteo$TEMP_MIN
days <- Metdata$meteo$DAY
lat <- Metdata$LATITUDE
rad_mea <- Metdata$meteo$RAD_MEA
hacal(lat=lat,days=days,rad_mea,extraT=NULL,tmax=tmax, tmin=tmin)



