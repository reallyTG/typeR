library(TSdist)


### Name: ARLPCCepsDistance
### Title: Dissimilarity Based on LPC Cepstral Coefficients
### Aliases: ARLPCCepsDistance

### ** Examples


# The objects example.series3 and example.series4 are two 
# numeric series of length 100 and 120 contained in the 
# TSdist package obtained from an ARIMA(3,0,2) process. 

data(example.series3)
data(example.series4)

# For information on their generation and shape see 
# help page of example.series.

help(example.series)

# Calculate the ar.lpc.ceps distance between the two series using
# the default parameters. In this case an AR model is automatically 
# selected for each of the series:

ARLPCCepsDistance(example.series3, example.series4)

# Calculate the ar.lpc.ceps distance between the two series
# imposing the order of the ARIMA model of each series:

ARLPCCepsDistance(example.series3, example.series4, order.x=c(3,0,2), 
order.y=c(3,0,2))




