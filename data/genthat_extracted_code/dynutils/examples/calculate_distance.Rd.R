library(dynutils)


### Name: calculate_distance
### Title: Distance metrics
### Aliases: calculate_distance correlation_distance manhattan_distance
###   euclidean_distance

### ** Examples

## Generate two matrices with 50 and 100 samples
x <- matrix(rnorm(50*10, mean = 0, sd = 1), ncol = 10)
y <- matrix(rnorm(100*10, mean = 1, sd = 2), ncol = 10)

dist_euclidean <- calculate_distance(x, y, method = "euclidean")
dist_manhattan <- calculate_distance(x, y, method = "manhattan")
dist_spearman <- calculate_distance(x, y, method = "spearman")
dist_pearson <- calculate_distance(x, y, method = "pearson")
dist_kendall <- calculate_distance(x, y, method = "kendall")



