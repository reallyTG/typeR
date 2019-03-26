library(sirad)


### Name: bccal
### Title: Calibrate Bristow-Campbell model
### Aliases: bccal

### ** Examples

data(Metdata)
tmax <- Metdata$meteo$TEMP_MAX
tmin <- Metdata$meteo$TEMP_MIN
days <- Metdata$meteo$DAY
lat <- Metdata$LATITUDE
rad_mea <- Metdata$meteo$RAD_MEA
bccal(lat,days,rad_mea,extraT=NULL,BCc=2,tmax,tmin, tal=0.76)



