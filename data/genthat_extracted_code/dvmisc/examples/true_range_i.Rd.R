library(dvmisc)


### Name: true_range_i
### Title: True Range of Integer Values
### Aliases: true_range_i

### ** Examples

# In general, true_range_i is much faster than diff(range(x))
x <- rpois(1000, lambda = 5)
all.equal(diff(range(x)), true_range_i(x))
benchmark(diff(range(x)), true_range_i(x), replications = 5000)




