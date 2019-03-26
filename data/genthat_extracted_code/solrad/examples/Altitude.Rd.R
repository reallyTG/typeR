library(solrad)


### Name: Altitude
### Title: Solar Altitude Angle
### Aliases: Altitude
### Keywords: Altitude

### ** Examples


#Calculating solar altitude angle for two consecutive days

DOY <- seq(0, 2, .05)

alpha <- Altitude(DOY, Lat = 45, Lon=0, SLon=0, DS=60)
#Note: only the difference between Lon and SLon matters not each value

plot(DOY, alpha)



