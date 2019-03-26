library(TSdist)


### Name: ManhattanDistance
### Title: Manhattan distance.
### Aliases: ManhattanDistance

### ** Examples


# The objects example.series1 and example.series2 are two 
# numeric series of length 100 contained in the TSdist package. 

data(example.series1)
data(example.series2)

# For information on their generation and shape see help 
# page of example.series.

help(example.series)

# Compute the Manhattan distance between them:

ManhattanDistance(example.series1, example.series2)



