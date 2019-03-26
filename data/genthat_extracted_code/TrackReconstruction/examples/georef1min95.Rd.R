library(TrackReconstruction)


### Name: georef1min95
### Title: GeoReferenced fur seal track
### Aliases: georef1min95
### Keywords: datasets

### ** Examples

data(georef1min95)
head(georef1min95);tail(georef1min95)
str(georef1min95)
plot(georef1min95$Longitude, georef1min95$Latitude,pch=".")
data(gpsdata95)
points(gpsdata95$Longitude,gpsdata95$Latitude,col="red",pch="*")




