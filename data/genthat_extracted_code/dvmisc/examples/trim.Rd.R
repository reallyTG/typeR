library(dvmisc)


### Name: trim
### Title: Trim Tail Values off of a Vector
### Aliases: trim

### ** Examples

# Generate data from N(0, 1) and then trim the lower and upper 1%
x <- rnorm(1000)
y <- trim(x, p = 0.01)

# Generate data from N(0, 1) and then trim values outside of (-1.5, 1.5)
x <- rnorm(100000)
y <- trim(x, cutpoints = c(-1.5, 1.5))




