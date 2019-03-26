library(kdtools)


### Name: kd_lower_bound
### Title: Search sorted data
### Aliases: kd_lower_bound kd_upper_bound kd_range_query kd_binary_search

### ** Examples

x = matrix(runif(200), 100)
y = matrix_to_tuples(x)
kd_sort(y, inplace = TRUE)
y[kd_lower_bound(y, c(1/2, 1/2)),]
y[kd_upper_bound(y, c(1/2, 1/2)),]
kd_binary_search(y, c(1/2, 1/2))
kd_range_query(y, c(1/3, 1/3), c(2/3, 2/3))




