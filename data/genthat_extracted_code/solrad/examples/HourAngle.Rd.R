library(solrad)


### Name: HourAngle
### Title: Solar Hour Angle
### Aliases: HourAngle
### Keywords: Angle Hour

### ** Examples


#Calculating solar hour angle for two consecutive days

DOY <- seq(0, 2, .05)

h <- HourAngle(DOY, Lon=0, SLon=0, DS=60)
#Note: only the difference between Lon and SLon matters not each value

plot(DOY, h)




