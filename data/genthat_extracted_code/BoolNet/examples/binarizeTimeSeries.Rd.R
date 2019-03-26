library(BoolNet)


### Name: binarizeTimeSeries
### Title: Binarize a set of real-valued time series
### Aliases: binarizeTimeSeries
### Keywords: Boolean network binarization binarize k-means edge detector
###   scan statistic

### ** Examples

# load test data
data(yeastTimeSeries)
			
# perform binarization with k-means
bin <- binarizeTimeSeries(yeastTimeSeries)
print(bin)

# perform binarization with scan statistic
# - will find and remove 2 insignificant genes!
bin <- binarizeTimeSeries(yeastTimeSeries, method="scanStatistic",
                          dropInsignificant=TRUE, sign.level=0.2)
print(bin)

# perform binarization with edge detector
bin <- binarizeTimeSeries(yeastTimeSeries, method="edgeDetector")
print(bin)

# reconstruct a network from the data
reconstructed <- reconstructNetwork(bin$binarizedMeasurements,
                                    method="bestfit", maxK=4)
print(reconstructed)



