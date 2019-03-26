library(xspliner)


### Name: approx_with_spline
### Title: Approximate spline on data
### Aliases: approx_with_spline approx_with_monotonic_spline

### ** Examples

x <- sort(rnorm(20, 5, 5))
y <- rnorm(20, 2, 2)
env <- new.env()
approx_with_spline(data.frame(x = x, y = y), "y", "x", env)

approx_with_monotonic_spline(data.frame(x = x, y = y), "y", "x", env, "up")



