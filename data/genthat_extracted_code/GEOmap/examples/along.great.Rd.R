library(GEOmap)


### Name: along.great
### Title: Along A great Arc
### Aliases: along.great
### Keywords: misc

### ** Examples

lat1 <- 48.856578
lon1 <- 2.351828	

A = along.great(lat1*pi/180, lon1*pi/180, 50*pi/180, -63*pi/180)

lat=A$phi*180/pi
lon = A$lam*180/pi





