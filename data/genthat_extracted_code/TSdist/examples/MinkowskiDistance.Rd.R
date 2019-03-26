library(TSdist)


### Name: MinkowskiDistance
### Title: Minkowski distance.
### Aliases: MinkowskiDistance

### ** Examples


# The objects example.series1 and example.series2 are two 
# numeric series of length 100 contained in the TSdist package. 

data(example.series1)
data(example.series2)

# For information on their generation and shape see help 
# page of example.series.

help(example.series)


# Compute the Minkowski distance between them:

MinkowskiDistance(example.series1, example.series2, p=3)



