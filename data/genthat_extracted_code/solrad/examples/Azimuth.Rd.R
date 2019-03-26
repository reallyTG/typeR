library(solrad)


### Name: Azimuth
### Title: Solar Azimuth Angle
### Aliases: Azimuth
### Keywords: Azimuth

### ** Examples


#Calculating solar azimuth angle for two consecutive days on 45 degree lat and 10 degree lon

DOY <- seq(0, 2, .05)

Az <- Azimuth(DOY, Lat = 45, Lon=10, SLon=10, DS=0)
#Note: only the difference between Lon and SLon matters not each value

plot(DOY, Az)




