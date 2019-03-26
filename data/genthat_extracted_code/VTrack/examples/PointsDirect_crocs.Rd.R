library(VTrack)


### Name: PointsDirect_crocs
### Title: Points File Containing VR2 Locations on the Wenlock River in
###   2008
### Aliases: PointsDirect_crocs
### Keywords: datasets

### ** Examples

# Load the points file for the Wenlock River
data(PointsDirect_crocs)
head(PointsDirect_crocs)

# Plot the locations of the receivers
par(mfrow=c(1,1),las=1,bty="l")
plot(PointsDirect_crocs$LONGITUDE,PointsDirect_crocs$LATITUDE,
     pch=10,cex=1,xlab="Longitude",ylab="Latitude")



