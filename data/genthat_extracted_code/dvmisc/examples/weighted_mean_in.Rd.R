library(dvmisc)


### Name: weighted_mean_in
### Title: Weighted Arithmetic Mean for Integer Values and Numeric Weights
### Aliases: weighted_mean_in

### ** Examples

# weighted_mean_in is typically much faster than weighted.mean
x <- rpois(1000, lambda = 5)
w <- runif(1000)
all.equal(weighted.mean(x, w), weighted_mean_in(x, w))
benchmark(weighted.mean(x, w), weighted_mean_in(x, w), replications = 2000)




