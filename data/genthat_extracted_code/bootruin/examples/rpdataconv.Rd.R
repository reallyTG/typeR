library(bootruin)


### Name: rpdataconv
### Title: Convert a List of Numerics to a Matrix
### Aliases: rpdataconv
### Keywords: array manip internal

### ** Examples

# Gemerate samples of different size from an
# exponential distribution with different parameters
x <- list(rexp(10, 0.2), rexp(7, 0.1), rexp(12, 0.5))

# Write x into a matrix that can be further processed
x.rp <- bootruin:::rpdataconv(x)



