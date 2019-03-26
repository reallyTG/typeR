library(TSdist)


### Name: CIDDistance
### Title: Complexity-Invariant Distance Measure For Time Series
### Aliases: CIDDistance

### ** Examples

# The objects example.series1 and example.series2 are two 
# numeric series of length 100.

data(example.series1)
data(example.series2)

# For information on their generation and shape see 
# help page of example.series.

help(example.series)

# Calculate the compression based distance between the two series using
# the default parameters. 

CIDDistance(example.series1, example.series2)





