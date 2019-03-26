library(VTrack)


### Name: GenerateCircuitousDistance
### Title: Converts a Points File into a Distance Matrix Using the
###   Circuitous Distances Along a Series of Receivers or Stations
### Aliases: GenerateCircuitousDistance
### Keywords: spatial

### ** Examples


# Load the points file
data(PointsCircuitous_crocs)

# Generate the Circuitous Distance Matrix
CircuitousDM <- GenerateCircuitousDistance(PointsCircuitous_crocs)

# Now plot example of how circuitous distances between receivers were generated
# In this example an individual must follow the course of the river in order to
#   move between receivers
par(mfrow=c(1,1),las=1,bty="l")
plot(PointsCircuitous_crocs$LONGITUDE,PointsCircuitous_crocs$LATITUDE,
    pch=1,cex=0.5,col="grey",xlab="Longitude",ylab="Latitude")
lines(PointsCircuitous_crocs$LONGITUDE,PointsCircuitous_crocs$LATITUDE,
      col="grey",lwd=0.3,lty=3)

Receiversonly <- na.omit(PointsCircuitous_crocs)
points(Receiversonly$LONGITUDE,Receiversonly$LATITUDE,pch=10,cex=1)



