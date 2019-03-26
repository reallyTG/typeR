library(sirad)


### Name: modeval
### Title: Model performance statistics.
### Aliases: modeval

### ** Examples


data(Metdata)
B <- 0.11
tmax <- Metdata$meteo$TEMP_MAX
tmin <- Metdata$meteo$TEMP_MIN
days <- Metdata$meteo$DAY
lat <- Metdata$LATITUDE
solrad_measured <- Metdata$meteo$RAD_MEA
solrad_BC <- bc(days, lat, extraT=NULL, BCb=B, tmax, tmin, BCc=2, tal=0.76) 

modeval(solrad_BC,solrad_measured)
modeval(solrad_BC,solrad_measured,stat="EF")



