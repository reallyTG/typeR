library(geoelectrics)


### Name: parseProcessedDataFile
### Title: Parses a Processed Data File
### Aliases: parseProcessedDataFile

### ** Examples

fileAddress <- system.file('extdata/processed/p1_DipolDipol_SW-NE.xyz',
                   package = 'geoelectrics')

processedData = new('ProcessedData')
processedData@address = fileAddress
processedData@points <- parseProcessedDataFile(address = fileAddress)[[1]]
processedData@pointsWithTopo <- parseProcessedDataFile(address = fileAddress)[[2]]



