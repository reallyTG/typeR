library(scanstatistics)


### Name: dist_to_knn
### Title: Given a distance matrix, find the k nearest neighbors.
### Aliases: dist_to_knn

### ** Examples

x <- matrix(c(0, 0,
              1, 0,
              2, 1,
              0, 4,
              1, 3),
            ncol = 2, byrow = TRUE)
d <- dist(x, diag = TRUE, upper = TRUE)
dist_to_knn(d, k = 3)



