library(circular)


### Name: weighted.mean.circular
### Title: Weighted Mean Direction
### Aliases: weighted.mean.circular
### Keywords: univar

### ** Examples

# Compute the weighted mean direction of a random sample of observations.
x <- circular(runif(50, circular(0), pi))
w <- runif(50, 0, 1)
weighted.mean(x, w)



