library(TSdist)


### Name: PACFDistance
### Title: Partial Autocorrelation-based Dissimilarity
### Aliases: PACFDistance

### ** Examples


# The objects example.series3 and example.series4 are two 
# numeric series of length 100 and 120 contained in the 
# TSdist package. 

data(example.series3)
data(example.series4)

# For information on their generation and shape see 
# help page of example.series.

help(example.series)

# Calculate the autocorrelation based distance between the two series using
# the default parameters:

PACFDistance(example.series3, example.series4)




