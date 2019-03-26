library(sirad)


### Name: apcal
### Title: Calibrate Angstrom-Prescott model
### Aliases: apcal

### ** Examples

## Calibrate the model based on measured data
data(Metdata)
sunshine <- Metdata$meteo$SUNSHINE
days <- Metdata$meteo$DAY
lat <- Metdata$LATITUDE
rad_mea <- Metdata$meteo$RAD_MEA
apcal(lat=lat,days=days,rad_mea,extraT=NULL,DL=NULL,SSD=sunshine)



