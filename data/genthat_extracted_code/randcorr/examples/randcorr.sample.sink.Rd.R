library(randcorr)


### Name: randcorr.sample.sink
### Title: Sample from the (unnormalized) distribution sin(x)^k, 0 < x <
###   pi, k >= 1
### Aliases: randcorr.sample.sink

### ** Examples

# -----------------------------------------------------------------
# Example 1: Draw a random variate from sin(x), 0<x<pi
x = randcorr.sample.sink(1)

# Example 2: Draw a million random variate from sin^3(x), 0<x<pi
x = randcorr.sample.sink( matrix(3, 1e6,1) )
mean(x)
var(x)





