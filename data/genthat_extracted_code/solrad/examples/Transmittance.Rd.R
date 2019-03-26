library(solrad)


### Name: Transmittance
### Title: Atmospheric Transmittance
### Aliases: Transmittance
### Keywords: Atmospheric Transmittance

### ** Examples


#Calculating atmospheric transmittance coefficient for two consecutive days on 45 degree
# latitude and 10 degree longitude and at 100 m altitude.

DOY <- seq(0, 2, .05)

tb <- Transmittance(DOY, Lat = 45, Lon=10, SLon=10, DS=0, Elevation = 100)

#Note: only the difference between Lon and SLon matters not each value

plot(DOY, tb)




