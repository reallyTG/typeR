library(sirad)


### Name: et0
### Title: FAO Penman-Monteith evapotranspiration equation
### Aliases: et0

### ** Examples

data(Metdata)
tmax <- Metdata$meteo$TEMP_MAX
tmin <- Metdata$meteo$TEMP_MIN
vpres <- Metdata$meteo$VAP_PRES
days <- Metdata$meteo$DAY
lat <- Metdata$LATITUDE
rad_mea <- Metdata$meteo$RAD_MEA
z <- Metdata$ALTITUDE
wind <-  Metdata$meteo$WIND_10

tal <- cst(rad_mea,dayOfYear(Metdata$meteo$DAY),radians(Metdata$LATITUDE)) 

et0(Tmax=tmax,Tmin=tmin, vap_pres=vpres,sol_rad=rad_mea,tal=tal,z=Metdata$ALTITUDE,
uz=wind,meah=10,extraT=NA,days=days,lat=lat)



