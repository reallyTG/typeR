library(dvmisc)


### Name: range_n
### Title: Range (Actually Minimum and Maximum) of Numeric Values
### Aliases: range_n

### ** Examples

# In general, range_n is much faster than range
x <- rnorm(1000)
all.equal(range(x), range_n(x))
benchmark(range(x), range_n(x), replications = 5000)

# For integer vectors, range_i should be even faster
x <- rpois(1000, lambda = 5) 
all.equal(range(x), range_i(x))
benchmark(range(x), range_n(x), range_i(x), replications = 10000)




