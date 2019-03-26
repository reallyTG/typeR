library(dvmisc)


### Name: weighted_mean_nn
### Title: Weighted Arithmetic Mean for Numeric Values and Numeric Weights
### Aliases: weighted_mean_nn

### ** Examples

# weighted_mean_nn is typically much faster than weighted.mean
x <- rnorm(1000)
w <- runif(1000)
all.equal(weighted.mean(x, w), weighted_mean_nn(x, w))
benchmark(weighted.mean(x, w), weighted_mean_nn(x, w), replications = 2000)




