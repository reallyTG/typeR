library(TrackReconstruction)


### Name: georef1min02
### Title: GeoReferenced fur seal track
### Aliases: georef1min02
### Keywords: datasets

### ** Examples

data(georef1min02)
head(georef1min02);tail(georef1min02)
str(georef1min02)
plot(georef1min02$Longitude, georef1min02$Latitude,pch=".")
data(gpsdata02)
points(gpsdata02$Longitude,gpsdata02$Latitude,col="red",pch="*")




