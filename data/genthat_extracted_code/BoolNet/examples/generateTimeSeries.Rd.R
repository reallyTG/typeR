library(BoolNet)


### Name: generateTimeSeries
### Title: Generate time series from a network
### Aliases: generateTimeSeries
### Keywords: time series Boolean network synchronous update asynchronous
###   update

### ** Examples

# generate noisy time series from the cell cycle network
data(cellcycle)
ts <- generateTimeSeries(cellcycle, numSeries=50, numMeasurements=10, noiseLevel=0.1)

# binarize the noisy time series
bin <- binarizeTimeSeries(ts, method="kmeans")$binarizedMeasurements

# reconstruct the network
print(reconstructNetwork(bin, method="bestfit"))



