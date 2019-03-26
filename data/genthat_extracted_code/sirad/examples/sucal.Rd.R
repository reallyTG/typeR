library(sirad)


### Name: sucal
### Title: Calibrate Supit-Van Kappel model
### Aliases: sucal

### ** Examples

data(Metdata)
tmax <- Metdata$meteo$TEMP_MAX
tmin <- Metdata$meteo$TEMP_MIN
days <- Metdata$meteo$DAY
lat <- Metdata$LATITUDE
rad_mea <- Metdata$meteo$RAD_MEA
CC <- Metdata$meteo$CLOUD_DAYTIME_TOTAL
sucal(lat=lat,days=days,rad_mea, extraT=NULL,tmax=tmax, tmin=tmin,cc=CC)



