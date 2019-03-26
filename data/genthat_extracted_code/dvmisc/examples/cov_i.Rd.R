library(dvmisc)


### Name: cov_i
### Title: Sample Covariance for Integer Vectors
### Aliases: cov_i

### ** Examples

# For integer vectors, cov_i is typically much faster than cov.
x <- rpois(1000, lambda = 5)
y <- rpois(1000, lambda = 5)
all.equal(cov(x, y), cov_i(x, y))
benchmark(cov(x, y), cov_i(x, y), replications = 5000)




