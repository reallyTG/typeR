library(dvmisc)


### Name: diff_n
### Title: Lagged Differences for Numeric Values
### Aliases: diff_n

### ** Examples

# In general, diff_n is much faster than diff
x <- rnorm(1000)
all.equal(diff(x, 2), diff_n(x, 2))
benchmark(diff(x, 2), diff_n(x, 2), replications = 2000)

# For integer vectors, diff_i should be even faster
x <- rpois(1000, lambda = 5)
all.equal(diff(x, 2), diff_i(x, 2))
benchmark(diff(x, 2), diff_n(x, 2), diff_i(x, 2), replications = 2000)




