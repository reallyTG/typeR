library(dvmisc)


### Name: which_max_iv
### Title: Return Index of (First) Maximum of an Integer Vector
### Aliases: which_max_iv

### ** Examples

# For long vectors, which_max_iv is faster than which.max
x <- rpois(10000, lambda = 15)
which.max(x) == which_max_iv(x)
benchmark(which.max(x), which_max_iv(x), replications = 5000)

# For shorter vectors, which_max_iv is slower than which.max
x <- rpois(100, lambda = 15)
which.max(x) == which_max_iv(x)
benchmark(which.max(x), which_max_iv(x), replications = 20000)




