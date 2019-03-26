library(geoelectrics)


### Name: parseRawDataFile
### Title: Parses a Raw Data File
### Aliases: parseRawDataFile

### ** Examples

fileAddress <- system.file('extdata/raw/p1_DipolDipol_SW-NE.dat',
                   package = 'geoelectrics')
                   
rawData = new('RawData')
rawData@address = fileAddress
rawData@points <- parseRawDataFile(address = fileAddress)



