library(geoelectrics)


### Name: levelplot
### Title: Levelplot of Geoelectrics Data
### Aliases: levelplot levelplot,Profile-method levelplotProcessedData
###   levelplotProcessedDataWithTopo levelplotRawData

### ** Examples

data(sinkhole)

levelplot(sinkhole@profiles[[1]], dataType = 'processed', withTopo = FALSE)
levelplotLegendLabel()

levelplot(sinkhole@profiles[[1]], dataType = 'processed', withTopo = TRUE)
levelplotLegendLabel()

levelplot(sinkhole@profiles[[1]], dataType = 'raw')
levelplotLegendLabel()



