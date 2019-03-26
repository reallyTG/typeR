library(dvmisc)


### Name: which_min_nv
### Title: Return Index of (First) Minimum of a Numeric Vector
### Aliases: which_min_nv

### ** Examples

# For long vectors, which_min_nv is faster than which.min
x <- rnorm(100000)
which.min(x) == which_min_nv(x)
benchmark(which.min(x), which_min_nv(x), replications = 1000)

# For shorter vectors, which_min_nv is slower than which.min
x <- rnorm(100)
which.min(x) == which_min_nv(x)
benchmark(which.min(x), which_min_nv(x), replications = 10000)




