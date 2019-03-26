library(BoolNet)


### Name: reconstructNetwork
### Title: Reconstruct a Boolean network from time series of measurements
### Aliases: reconstructNetwork
### Keywords: probabilistic Boolean network PBN reconstruction REVEAL
###   best-fit extension

### ** Examples

# load example data
data(yeastTimeSeries)

# perform binarization with k-means
bin <- binarizeTimeSeries(yeastTimeSeries)

# reconstruct networks from binarized measurements
net <- reconstructNetwork(bin$binarizedMeasurements, method="bestfit", maxK=3, returnPBN=TRUE)

# print reconstructed net
print(net)

# plot reconstructed net
plotNetworkWiring(net)



