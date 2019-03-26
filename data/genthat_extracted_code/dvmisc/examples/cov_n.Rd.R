library(dvmisc)


### Name: cov_n
### Title: Sample Covariance for Numeric Vectors
### Aliases: cov_n

### ** Examples

# In general, cov_n is much faster than cov
x <- rnorm(1000)
y <- rnorm(1000)
all.equal(cov(x, y), cov_n(x, y))
benchmark(cov(x, y), cov_n(x, y), replications = 5000)

# For integer vectors, cov_i should be even faster.
x <- rpois(1000, lambda = 5)
y <- rpois(1000, lambda = 5)
all.equal(cov(x, y), cov_i(x, y))
benchmark(cov(x, y), cov_n(x, y), cov_i(x, y), replications = 5000)




