library(TrackReconstruction)


### Name: georef1min03
### Title: GeoReferenced fur seal track
### Aliases: georef1min03
### Keywords: datasets

### ** Examples

data(georef1min03)
head(georef1min03);tail(georef1min03)
str(georef1min03)
plot(georef1min03$Longitude, georef1min03$Latitude,pch=".")
data(gpsdata03)
points(gpsdata03$Longitude,gpsdata03$Latitude,col="red",pch="*")



