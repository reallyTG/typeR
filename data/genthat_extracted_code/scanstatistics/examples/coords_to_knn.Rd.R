library(scanstatistics)


### Name: coords_to_knn
### Title: Get the k nearest neighbors for each location, given its
###   coordinates.
### Aliases: coords_to_knn

### ** Examples

x <- matrix(c(0, 0,
              1, 0,
              2, 1,
              0, 4,
              1, 3),
            ncol = 2, byrow = TRUE)
plot(x)
coords_to_knn(x)



