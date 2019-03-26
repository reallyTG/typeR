library(solrad)


### Name: DiffuseRadiation
### Title: Solar Diffuse Radiation on a Surface
### Aliases: DiffuseRadiation
### Keywords: Diffuse Radiation

### ** Examples


#Calculating atmospheric transmittance coefficient for two consecutive days on 45 degree
# latitude and 10 degree longitude and at 100 m altitude.

DOY <- seq(0, 2, .05)

Sdifopen <- DiffuseRadiation(DOY, Lat = 45, Lon=10, SLon=10, DS=0, Elevation = 100, Slope = 0)
#Note: only the difference between Lon and SLon matters not each value

plot(DOY, Sdifopen)




