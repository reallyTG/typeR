library(geoelectrics)


### Name: ProcessedData-class
### Title: Processed Data Class
### Aliases: ProcessedData-class

### ** Examples

processedData = new('ProcessedData',
                     address = system.file('extdata/processed/p1_DipolDipol_SW-NE.xyz',
                     package='geoelectrics'))

data(sinkhole)
sinkhole@profiles[[1]]@processedData
sinkhole@profiles[[1]]@processedData@points
sinkhole@profiles[[1]]@processedData@pointsWithTopo
sinkhole@profiles[[1]]@processedData@height
sinkhole@profiles[[1]]@processedData@minData
sinkhole@profiles[[1]]@processedData@maxData



