library(Claddis)


### Name: ChangesInBins
### Title: Counts the changes in a series of time bins
### Aliases: ChangesInBins

### ** Examples


# Create a random dataset of 100 changes:
change.times <- runif(100, 0, 100)

# Create time bins:
time.bins <- seq(100, 0, length.out=11)

# Get N changes for each bin:
ChangesInBins(change.times, time.bins)




