library(dvmisc)


### Name: which_min_iv
### Title: Return Index of (First) Minimum of an Integer Vector
### Aliases: which_min_iv

### ** Examples

# For long vectors, which_min_iv is faster than which.min 
x <- rpois(10000, lambda = 15)
which.min(x) == which_min_iv(x)
benchmark(which.min(x), which_min_iv(x), replications = 5000)

# For shorter vectors, which_min_iv is slower than which.min
x <- rpois(100, lambda = 15)
which.min(x) == which_min_iv(x)
benchmark(which.min(x), which_min_iv(x), replications = 20000)




