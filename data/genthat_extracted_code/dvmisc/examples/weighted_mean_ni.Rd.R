library(dvmisc)


### Name: weighted_mean_ni
### Title: Weighted Arithmetic Mean for Numeric Values and Integer Weights
### Aliases: weighted_mean_ni

### ** Examples

# weighted_mean_ni is typically much faster than weighted.mean 
x <- rnorm(1000)
w <- rpois(1000, lambda = 5)
all.equal(weighted.mean(x, w), weighted_mean_ni(x, w))
benchmark(weighted.mean(x, w), weighted_mean_ni(x, w), replications = 2000)




