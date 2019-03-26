library(dvmisc)


### Name: var_n
### Title: Sample Variance for Numeric Values
### Aliases: var_n

### ** Examples

# In general, var_n is much faster than var.
x <- rnorm(1000)
all.equal(var(x), var_n(x))
benchmark(var(x), var_n(x), replications = 1000)

# For integer vectors, var_i should be even faster.
x <- rpois(1000, lambda = 5)
all.equal(var(x), var_i(x))
benchmark(var(x), var_n(x), var_i(x), replications = 1000)




