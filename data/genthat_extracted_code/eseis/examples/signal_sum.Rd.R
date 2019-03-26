library(eseis)


### Name: signal_sum
### Title: Calculate signal vector sum.
### Aliases: signal_sum
### Keywords: eseis

### ** Examples


## create random vectors
x <- runif(n = 1000, min = -1, max = 1)
y <- runif(n = 1000, min = -1, max = 1)
z <- runif(n = 1000, min = -1, max = 1)

## calculate vector sums
xyz <- signal_sum(x, y, z)
                     



