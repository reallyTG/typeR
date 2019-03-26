library(TrackReconstruction)


### Name: TrackReconstruction-package
### Title: Reconstruct animal tracks from biologger data.
### Aliases: TrackReconstruction-package TrackReconstruction
### Keywords: package

### ** Examples

betas<-Standardize(1,1,-1,1,1,1,-57.8,68.76,-61.8,64.2,-70.16,58.08,
	-10.1,9.55,-9.75,9.72, -9.91,9.43)
#get declination and inclination data for study area
decinc<-c(10.228,65.918)
#data set with 6 associated GPS fixes in the "gpsdata" data set
data(rawdata)
DRoutput<-DeadReckoning(rawdata,betas,decinc,Hz=16,RmL=2,DepthHz=1,SpdCalc=3,MaxSpd=3.5)
#prepare GPS data
data(gpsdata02)
gpsformat<-GPStable(gpsdata02)
Georeferenced<-GeoRef(DRoutput,gpsformat)
plot(Georeferenced$Longitude,Georeferenced$Latitude,pch=".")
points(gpsformat$Longitude[2],gpsformat$Latitude[2],pch="S",col="Red") #Start
points(gpsformat$Longitude[7],gpsformat$Latitude[7],pch="F",col="Blue") #Finish
#Intermediate GPS points
points(gpsformat$Longitude[3:6],gpsformat$Latitude[3:6],pch="*",col="Red")

## Not run: 
##D #plot the data with a bathymetric background, note how the axis dimensions have changed to 
##D #give a more realistic path relative to that produced in the simple plot call.  See the vignette
##D #or ?bathymetry for information on how to get bathymetric data for your study area.
##D data(bathymetry)
##D #This may take a minute or two
##D image.xyz=tapply(bathymetry$Depth, list(bathymetry$Long, bathymetry$Lat), unique)
##D Mapper(Georeferenced, gpsformat[2:7,], image.xyz, ExpFact = 500, minlat = 51, maxlat = 60,
##D minlong = -177, maxlong = -163, Title = "Fun Graph!!!")
##D #That entire animals trip plotted
##D data(georef1min02)
##D data(gpsdata02)
##D Mapper(georef1min02, gpsdata02, image.xyz, ExpFact = 500, minlat = 51, maxlat = 60,
##D minlong = -177, maxlong = -163, Title = "Fun Graph!!!")
## End(Not run)



