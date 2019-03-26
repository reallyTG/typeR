library(TSdist)


### Name: CDMDistance
### Title: Compression-based Dissimilarity measure
### Aliases: CDMDistance

### ** Examples


# The objects example.series3 and example.series4 are two 
# numeric series of length 100 and 120.

data(example.series3)
data(example.series4)

# For information on their generation and shape see 
# help page of example.series.

help(example.series)

# Calculate the compression based distance between the two series using
# the default parameters. 

CDMDistance(example.series3, example.series4)





