library(dvmisc)


### Name: min_n
### Title: Minimum of Numeric Values
### Aliases: min_n

### ** Examples

# For large objects, min_n is faster than min
x <- rnorm(100000)
min(x) == min_n(x)
benchmark(min(x), min_n(x), replications = 1000)

# For smaller objects, min_n is slower than min
x <- rnorm(100)
min(x) == min_n(x)
benchmark(min(x), min_n(x), replications = 20000)




