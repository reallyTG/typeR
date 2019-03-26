library(tidygenomics)


### Name: cluster_interval
### Title: Cluster ranges which are implemented as 2 equal-length numeric
###   vectors.
### Aliases: cluster_interval

### ** Examples

starts <- c(50, 100, 120)
ends <- c(75, 130, 150)
j <- cluster_interval(starts, ends)
j == c(0,1,1)



