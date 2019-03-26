library(solrad)


### Name: Incidence
### Title: Solar Incidence Angle
### Aliases: Incidence
### Keywords: Angle Incidence Solar

### ** Examples


#Calculating solar incidence angle for two consecutive days on 45 degree latitude and
# 10 degree longitude

DOY <- seq(0, 2, .05)

theta <- Incidence(DOY, Lat = 45, Lon=10, SLon=10, DS=0, Slope = 10, Aspect = 0)
#Note: only the difference between Lon and SLon matters not each value

plot(DOY, theta)




