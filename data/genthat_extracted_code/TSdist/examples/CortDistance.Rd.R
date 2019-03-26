library(TSdist)


### Name: CortDistance
### Title: Dissimilarity Index Combining Temporal Correlation and Raw Value
###   Behaviors
### Aliases: CortDistance

### ** Examples


# The objects example.series1 and example.series2 are two 
# numeric series of length 100.

data(example.series1)
data(example.series2)

# For information on their generation and shape see 
# help page of example.series.

help(example.series)

# Calculate the first correlation based distance between the series using the default 
# parameters.

CortDistance(example.series1, example.series2)






