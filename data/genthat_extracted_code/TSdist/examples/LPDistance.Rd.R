library(TSdist)


### Name: LPDistance
### Title: Lp distances.
### Aliases: LPDistance

### ** Examples


# The objects example.series1 and example.series2 are two 
# numeric series of length 100 contained in the TSdist package. 

data(example.series1)
data(example.series2)

# For information on their generation and shape see help 
# page of example.series.

help(example.series)

# Compute the different Lp distances

# Euclidean distance

LPDistance(example.series1, example.series2, method="euclidean")

# Manhattan distance

LPDistance(example.series1, example.series2, method="manhattan")

# Infinite norm distance

LPDistance(example.series1, example.series2, method="infnorm")

# Minkowski distance with p=3.

LPDistance(example.series1, example.series2, method="minkowski", p=3)




