library(rdist)


### Name: is_metric
### Title: Metric and triangle inequality
### Aliases: is_metric is_distance_matrix triangle_inequality

### ** Examples

data <- matrix(rnorm(20), ncol = 2)
dm <- pdist(data)
is_distance_matrix(dm)
triangle_inequality(dm)

dm[1, 2] <- 1.1 * dm[1, 2]
is_distance_matrix(dm)



