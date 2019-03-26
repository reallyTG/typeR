library(rerf)


### Name: RandMatTSpatch
### Title: Create a Random Matrix: ts-patch
### Aliases: RandMatTSpatch

### ** Examples


p <- 8
d <- 8
pwMin <- 3
pwMax <- 6
paramList <- list(p = p, d = d, pwMin = pwMin, pwMax = pwMax)
set.seed(8)
(a <- do.call(RandMatTSpatch, paramList))



