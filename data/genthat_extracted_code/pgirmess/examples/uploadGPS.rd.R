library(pgirmess)


### Name: uploadGPS
### Title: Upload waypoints to Garmin GPS
### Aliases: uploadGPS
### Keywords: IO connection

### ** Examples


## Not run: 
##D   # a GPS device must be connected
##D coords<-data.frame(ID=c("C18J01", "C18J02"),Long= c(-46.996602, 47.002745),
##D Lat=c(-6.148734, 6.14829),Alt=c(250,1230))
##D 
##D writeGPX(coords,"mywaypoints")
##D uploadGPS("mywaypoint.gpx")
## End(Not run)




