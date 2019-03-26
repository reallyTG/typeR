library(TSdist)


### Name: WavDistance
### Title: Dissimilarity for Time Series Based on Wavelet Feature
###   Extraction
### Aliases: WavDistance

### ** Examples


# The objects example.series1 and example.series2 are two 
# numeric series of length 100.

data(example.series1)
data(example.series2)

# For information on their generation and shape see 
# help page of example.series.

help(example.series)

# Calculate the distance based on wavelet feature extraction between the series.

WavDistance(example.series1, example.series2)






