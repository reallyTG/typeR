library(multiApply)


### Name: Apply
### Title: Apply Functions to Multiple Multidimensional Arrays or Vectors
### Aliases: Apply

### ** Examples

#Change in the rate of exceedance for two arrays, with different 
#dimensions, for some matrix of exceedances.
data <- list(array(rnorm(1000), c(5, 10, 20)), 
             array(rnorm(500), c(5, 10, 10)), 
             array(rnorm(50), c(5, 10)))
test_fun <- function(x, y, z) {
  ((sum(x > z) / (length(x))) / 
  (sum(y > z) / (length(y)))) * 100
}
test <- Apply(data, target = list(3, 3, NULL), test_fun)



