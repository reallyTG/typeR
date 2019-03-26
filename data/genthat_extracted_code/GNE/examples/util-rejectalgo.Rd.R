library(GNE)


### Name: rejection
### Title: Rejection method for random generation.
### Aliases: rejection
### Keywords: optimize

### ** Examples


f <- function(x) x[1]^2 + x[2]^2 - 1

rejection(f, 2, -3, 3, method="unif")

rejection(f, 2, -3, 3, method="norm")




