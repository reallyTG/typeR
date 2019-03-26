library(MESS)


### Name: ordered.clusters
### Title: Check if unique elements of a vector appear in contiguous
###   clusters
### Aliases: ordered.clusters
### Keywords: utilities

### ** Examples


x <- c(1, 1, 1, 2, 2, 3, 4, 1, 5, 5, 5)
ordered.clusters(x)
ordered.clusters(sort(x))
ordered.clusters(x[order(x)])




