library(dvmisc)


### Name: weighted_mean_ii
### Title: Weighted Arithmetic Mean for Integer Values and Integer Weights
### Aliases: weighted_mean_ii

### ** Examples

# weighted_mean_ii is typically much faster than weighted.mean
x <- rpois(1000, lambda = 5)
w <- rpois(1000, lambda = 5)
all.equal(weighted.mean(x, w), weighted_mean_ii(x, w))
benchmark(weighted.mean(x, w), weighted_mean_ii(x, w), replications = 2000)




