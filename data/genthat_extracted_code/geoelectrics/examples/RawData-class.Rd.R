library(geoelectrics)


### Name: RawData-class
### Title: Raw Data Class
### Aliases: RawData-class

### ** Examples

rawData = new('RawData', address = system.file('extdata/raw/p1_DipolDipol_SW-NE.dat',
          package='geoelectrics'))

data(sinkhole)
sinkhole@profiles[[2]]@rawData
sinkhole@profiles[[2]]@rawData@address
sinkhole@profiles[[2]]@rawData@points



