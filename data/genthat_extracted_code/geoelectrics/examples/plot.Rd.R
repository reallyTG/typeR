library(geoelectrics)


### Name: plot,Profile,ANY-method
### Title: Plot Geoelectrics Data Points
### Aliases: plot,Profile,ANY-method plot plotProcessedData
###   plotProcessedDataWithTopo plotRawData plotRawDataWithTopo

### ** Examples

data(sinkhole)

plot(sinkhole@profiles[[1]], dataType = 'processed', withTopo = FALSE)
plotProcessedData(sinkhole@profiles[[1]])

plot(sinkhole@profiles[[1]], dataType = 'processed', withTopo = TRUE)
plotProcessedDataWithTopo(sinkhole@profiles[[1]])

plot(sinkhole@profiles[[1]], dataType = 'raw', withTopo = FALSE)
plotRawData(sinkhole@profiles[[1]])

plot(sinkhole@profiles[[1]], dataType = 'raw', withTopo = TRUE)
plotRawDataWithTopo(sinkhole@profiles[[1]])



