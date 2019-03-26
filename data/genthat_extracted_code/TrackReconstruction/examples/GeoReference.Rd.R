library(TrackReconstruction)


### Name: GeoReference
### Title: Georeference the Dead Reckoning data between two GPS points
### Aliases: GeoReference
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Standardize tag output
betas<-Standardize(1,1,-1,1,1,1,-57.8,68.76,-61.8,64.2,-70.16,58.08,
	-10.1,9.55,-9.75,9.72,-9.91,9.43)
#get declination and inclination data for study area
decinc<-c(10.228,65.918)
#data set with 7 associated GPS fixes in the "gpsdata02" data set
data(rawdata)
DRoutput<-DeadReckoning(rawdata,betas,decinc,Hz=16,RmL=2,DepthHz=1,SpdCalc=3,MaxSpd=3.5)
#prepare GPS data
data(gpsdata02)
gpsformat<-GPStable(gpsdata02)
Georeferenced<-GeoReference(DRoutput,gpsformat[c(2,3),])
plot(Georeferenced$Longitude,Georeferenced$Latitude,pch=".")
points(gpsformat$Longitude[2],gpsformat$Latitude[2],pch="S",col="Red")
points(gpsformat$Longitude[3],gpsformat$Latitude[3],pch="F",col="Blue")



