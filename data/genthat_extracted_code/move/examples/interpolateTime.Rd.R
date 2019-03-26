library(move)


### Name: interpolateTime
### Title: Interpolate a trajectory
### Aliases: interpolateTime
###   interpolateTime,.MoveTrackSingle,numeric-method
###   interpolateTime,.MoveTrackSingle,POSIXct-method
###   interpolateTime,.MoveTrackSingle,difftime-method

### ** Examples

data(leroy)
## providing the number of locations
plot(leroy[100:150,], col="red",pch=20)
points(mv <- interpolateTime(leroy[100:150,], time=500, spaceMethod='greatcircle'))

## providing a time interval
plot(leroy[100:150,], col="red",pch=20)
points(mv2 <- interpolateTime(leroy[100:150,], time=as.difftime(10, units="mins"), 
                              spaceMethod='greatcircle'))

## providing a vector of timestamps
plot(leroy[100:150,], col="red",pch=20)
ts <- as.POSIXct(c("2009-02-13 10:00:00", "2009-02-13 12:00:00", "2009-02-13 14:00:00",
                   "2009-02-13 16:00:00","2009-02-13 18:00:00","2009-02-13 20:00:00",
                   "2009-02-13 22:00:00","2009-02-14 00:00:00","2009-02-14 02:00:00",
                   "2009-02-14 04:00:00","2009-02-14 06:00:00", "2009-02-14 08:00:00", 
                   "2009-02-14 10:00:00"),  format="%Y-%m-%d %H:%M:%S", tz="UTC")
points(mv3 <- interpolateTime(leroy[100:150,], time=ts, spaceMethod='greatcircle'))




