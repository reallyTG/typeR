library(solrad)


### Name: Solar
### Title: Calculating Solar Variables
### Aliases: Solar
### Keywords: Solar Variables

### ** Examples


#Calculating solar variables and angles

DOY <- seq(0, 2, .05)

solar <- Solar(DOY, Lat = 45, Lon=10, SLon=10, DS=0, Elevation = 1000, Slope = 10, Aspect = 0)
#Note: only the difference between Lon and SLon matters not each value

par(mfrow=c(3,1))
plot(DOY, solar$Altitude, ylim = c(-90,90))
plot(DOY, solar$Azimuth, col= 'red')

plot(DOY, solar$Sdiropen)
lines(DOY, solar$Sdifopen, col='red')




