library(TrackReconstruction)


### Name: georef1min26
### Title: GeoReferenced fur seal track
### Aliases: georef1min26
### Keywords: datasets

### ** Examples

data(georef1min26)
head(georef1min26);tail(georef1min26)
str(georef1min26)
plot(georef1min26$Longitude, georef1min26$Latitude,pch=".")
data(gpsdata26)
points(gpsdata26$Longitude,gpsdata26$Latitude,col="red",pch="*")




