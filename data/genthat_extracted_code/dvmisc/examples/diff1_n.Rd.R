library(dvmisc)


### Name: diff1_n
### Title: 1-Unit Lagged Differences for Numeric Values
### Aliases: diff1_n

### ** Examples

# In general, diff1_n is much faster than diff
x <- rnorm(1000)
all.equal(diff(x), diff1_n(x))
benchmark(diff(x), diff1_n(x), replications = 3000)

# For integer vectors, diff1_i should be even faster
x <- rpois(1000, lambda = 5)
all.equal(diff(x), diff1_i(x))
benchmark(diff(x), diff1_n(x), diff1_i(x), replications = 3000)




