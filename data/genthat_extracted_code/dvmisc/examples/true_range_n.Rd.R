library(dvmisc)


### Name: true_range_n
### Title: True Range of Numeric Values
### Aliases: true_range_n

### ** Examples

# In general, true_range_n is much faster than diff(range(x))
x <- rnorm(1000)
all.equal(diff(range(x)), true_range_n(x))
benchmark(diff(range(x)), true_range_n(x), replications = 5000)

# For integer vectors, true_range_i should be even faster
x <- rpois(1000, lambda = 5)
all.equal(diff(range(x)), true_range_i(x))
benchmark(diff(range(x)), true_range_n(x), true_range_i(x), 
          replications = 5000)




