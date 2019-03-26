library(geoelectrics)


### Name: GpsCoordinates-class
### Title: GPS Coordinates Class
### Aliases: GpsCoordinates-class

### ** Examples

gpsCoordinates = new('GpsCoordinates', address = system.file('extdata/gps/p1.txt',
                 package='geoelectrics'))

data(sinkhole)
sinkhole@profiles[[1]]@gpsCoordinates
sinkhole@profiles[[1]]@gpsCoordinates@address
sinkhole@profiles[[1]]@gpsCoordinates@exact
sinkhole@profiles[[1]]@gpsCoordinates@lm
sinkhole@profiles[[1]]@gpsCoordinates@relative
sinkhole@profiles[[1]]@gpsCoordinates@lmRelative



