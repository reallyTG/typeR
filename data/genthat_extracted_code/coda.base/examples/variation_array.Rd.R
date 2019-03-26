library(coda.base)


### Name: variation_array
### Title: Variation array is returned.
### Aliases: variation_array

### ** Examples

set.seed(1)
X = matrix(exp(rnorm(5*100)), nrow=100, ncol=5)
variation_array(X)
variation_array(X, only_variation = TRUE)



