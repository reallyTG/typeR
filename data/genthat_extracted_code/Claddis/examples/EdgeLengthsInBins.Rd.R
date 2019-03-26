library(Claddis)


### Name: EdgeLengthsInBins
### Title: Edge-lengths present in time-bins
### Aliases: EdgeLengthsInBins

### ** Examples


# Create a random 10-taxon tree:
tree <- rtree(10)

# Add root age:
tree$root.time <- 100

# Create time bins:
time.bins <- seq(100, 0, length.out = 11)

# Get edge lengths for each bin:
EdgeLengthsInBins(tree, time.bins)




