library(rddapp)


### Name: dc_test
### Title: McCrary Sorting Test
### Aliases: dc_test

### ** Examples

# No discontinuity
x <- runif(1000, -1, 1)
dc_test(x, 0)

# Discontinuity
x <- runif(1000, -1, 1)
x <- x + 2 * (runif(1000, -1, 1) > 0 & x < 0)
dc_test(x, 0)



