library(TSdist)


### Name: ACFDistance
### Title: Autocorrelation-based Dissimilarity
### Aliases: ACFDistance

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

ACFDistance(example.series3, example.series4)




