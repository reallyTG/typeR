library(dvmisc)


### Name: which_max_nv
### Title: Return Index of (First) Maximum of a Numeric Vector
### Aliases: which_max_nv

### ** Examples

# For long vectors, which_max_nv is faster than which.max
x <- rnorm(100000)
which.max(x) == which_max_nv(x)
benchmark(which.max(x), which_max_nv(x), replications = 500)

# For shorter vectors, which_max_nv is slower than which.max
x <- rnorm(100)
which.max(x) == which_max_nv(x)
benchmark(which.max(x), which_max_nv(x), replications = 10000)




