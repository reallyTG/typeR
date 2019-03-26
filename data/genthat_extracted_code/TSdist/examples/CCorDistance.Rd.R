library(TSdist)


### Name: CCorDistance
### Title: Cross-correlation based distance.
### Aliases: CCorDistance

### ** Examples


# The objects example.series3 and example.series4 are two 
# numeric series of length 100 and 120 contained in the 
# TSdist package. 

data(example.series3)
data(example.series4)

# For information on their generation and shape see 
# help page of example.series.

help(example.series)

# Calculate the cross-correlation based distance 
# using the default lag.max.

CCorDistance(example.series3, example.series4)

# Calculate the cross-correlaion based distance 
# with lag.max=50.

CCorDistance(example.series3, example.series4, lag.max=50)




