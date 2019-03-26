library(VTrack)


### Name: GenerateDirectDistance
### Title: Converts a Points File into a Distance Matrix Using Direct
###   Distances Between Receivers or Stations
### Aliases: GenerateDirectDistance
### Keywords: spatial

### ** Examples

# Load the points file
data(PointsDirect_crocs)
# Generate the direct distance matrix
DirectDM <- GenerateDirectDistance(PointsDirect_crocs)

# Now plot example of how direct distances between receivers were generated
# In this example there are no structural boundary preventing an individual from 
#   moving between receivers
par(mfrow=c(1,1),las=1,bty="l")
plot(PointsDirect_crocs$LONGITUDE,PointsDirect_crocs$LATITUDE,pch=10,cex=1,
     xlab="Longitude",ylab="Latitude")
for(i in 1:length(PointsDirect_crocs$LONGITUDE))
  {
   lines(PointsDirect_crocs$LONGITUDE[c(1,i)],PointsDirect_crocs$LATITUDE[c(1,i)],
         lwd=0.3,col="grey",lty=3)
   }
points(PointsDirect_crocs$LONGITUDE,PointsDirect_crocs$LATITUDE,pch=10,cex=1)



