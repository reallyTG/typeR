library(scanstatistics)


### Name: knn_zones
### Title: Find the increasing subsets of k nearest neighbors for all
###   locations.
### Aliases: knn_zones

### ** Examples

nn <- matrix(c(1L, 2L, 4L, 3L, 5L,
               2L, 1L, 3L, 4L, 5L, 
               3L, 2L, 4L, 1L, 5L,
               4L, 1L, 2L, 3L, 5L,
               5L, 3L, 4L, 2L, 1L),
               ncol = 5, byrow = TRUE)
knn_zones(nn[, 1:3])



