library(TSdist)


### Name: CorDistance
### Title: Dissimilarities based on Pearson's correlation
### Aliases: CorDistance

### ** Examples


# The objects example.series1 and example.series2 are two 
# numeric series of length 100.

data(example.series1)
data(example.series2)

# For information on their generation and shape see 
# help page of example.series.

help(example.series)

# Calculate the first correlation based distance between the series.

CorDistance(example.series1, example.series2)

# Calculate the second correlation based distance between the series
# by specifying \eqn{beta}.

CorDistance(example.series1, example.series2, beta=2)




