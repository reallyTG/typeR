library(geoelectrics)


### Name: Profile-class
### Title: Profile Class
### Aliases: Profile-class

### ** Examples

p1 <- new('Profile',
           title = 'Profile 1',
           processedData =
             new('ProcessedData', address = system.file('extdata/processed/p1_DipolDipol_SW-NE.xyz',
                                      package='geoelectrics')),
           rawData =
             new('RawData', address = system.file('extdata/raw/p1_DipolDipol_SW-NE.dat',
                                      package='geoelectrics')),
           measurementType = 'DipoleDipole',
           gpsCoordinates =
             new('GpsCoordinates', address = system.file('extdata/gps/p1.txt',
                                             package='geoelectrics')))

p1@title
p1@processedData
p1@rawData
p1@measurementType
p1@gpsCoordinates

plot3d(p1)



