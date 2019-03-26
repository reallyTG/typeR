library(TrackReconstruction)


### Name: georef1min01
### Title: GeoReferenced fur seal track
### Aliases: georef1min01
### Keywords: datasets

### ** Examples

data(georef1min01)
head(georef1min01);tail(georef1min01)
str(georef1min01)
plot(georef1min01$Longitude, georef1min01$Latitude,pch=".")
data(gpsdata01)
points(gpsdata01$Longitude,gpsdata01$Latitude,col="red",pch="*")




