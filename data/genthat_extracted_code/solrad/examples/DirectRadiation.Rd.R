library(solrad)


### Name: DirectRadiation
### Title: Solar Direct Beam Radiation on Surface
### Aliases: DirectRadiation
### Keywords: Beam Direct Radiation

### ** Examples


#Calculating atmospheric transmittance coefficient for two consecutive days on 45 degree
#latitude and 10 degree longitude and at 100 m altitude.

DOY <- seq(0, 2, .05)

Sopen <- OpenRadiation(DOY, Lat = 45, Lon=10, SLon=10, DS=0, Elevation = 100)
#Note: only the difference between Lon and SLon matters not each value

plot(DOY, Sopen)




