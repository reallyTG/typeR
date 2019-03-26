library(Smisc)


### Name: linearMap
### Title: Linear mapping of a numeric vector or scalar
### Aliases: linearMap

### ** Examples

x <- seq(0, 1, length = 5)

# An increasing linear map
linearMap(x, R = c(4, 7))

# A decreasing map
linearMap(x, R = c(7, 4))

# A shift
linearMap(x, R = c(-1, 0))

# The identity map:
y <- linearMap(x, D = c(0, 1), R = c(0, 1))
identical(y, x)



