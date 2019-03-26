library(VTrack)


### Name: PointsCircuitous_crocs
### Title: Points File Containing VR2 Locations on the Wenlock River in
###   2008 with Waypoints Connecting Receivers
### Aliases: PointsCircuitous_crocs
### Keywords: datasets

### ** Examples

# Load the points file for the Wenlock River
data(PointsCircuitous_crocs)
head(PointsCircuitous_crocs)
receiversonly <- na.omit(PointsCircuitous_crocs)

# Plot the locations of the receivers plus the waypoints
par(mfrow=c(1,1),las=1,bty="l")
plot(PointsCircuitous_crocs$LONGITUDE, PointsCircuitous_crocs$LATITUDE,
     pch=1,cex=0.5,col="grey",xlab="Longitude",ylab="Latitude")
points(receiversonly$LONGITUDE,receiversonly$LATITUDE,cex=1,pch=10)



