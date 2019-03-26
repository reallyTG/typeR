library(TSdist)


### Name: PDCDistance
### Title: Permutation Distribution Distance
### Aliases: PDCDistance

### ** Examples


# The objects example.series1 and example.series2 are two 
# numeric series of length 100. 

data(example.series1)
data(example.series2)

# For information on their generation and shape see 
# help page of example.series.

help(example.series)

# Calculate the normalized compression based distance between the two series 
# using the default parameters.

PDCDistance(example.series1, example.series2)




