library(dvmisc)


### Name: range_i
### Title: Range (Actually Minimum and Maximum) of Integer Values
### Aliases: range_i

### ** Examples

# In general, range_i is much faster than range
x <- rpois(1000, lambda = 5) 
all.equal(range(x), range_i(x))
benchmark(range(x), range_i(x), replications = 10000)




