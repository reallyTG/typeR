library(dvmisc)


### Name: max_n
### Title: Maximum of Numeric Values
### Aliases: max_n

### ** Examples

# For large objects, max_n is faster than max
x <- rnorm(100000)
max(x) == max_n(x)
benchmark(max(x), max_n(x), replications = 1000)

# For smaller objects, max_n is slower than max
x <- rnorm(100)
max(x) == max_n(x)
benchmark(max(x), max_n(x), replications = 1000)




