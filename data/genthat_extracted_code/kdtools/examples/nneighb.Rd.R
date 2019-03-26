library(kdtools)


### Name: kd_nearest_neighbors
### Title: Find nearest neighbors
### Aliases: kd_nearest_neighbors kd_nearest_neighbor

### ** Examples

x = matrix(runif(200), 100)
y = matrix_to_tuples(x)
kd_sort(y, inplace = TRUE)
y[kd_nearest_neighbor(y, c(1/2, 1/2)),]
kd_nearest_neighbors(y, c(1/2, 1/2), 3)




