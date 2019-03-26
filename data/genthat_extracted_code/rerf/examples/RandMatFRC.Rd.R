library(rerf)


### Name: RandMatFRC
### Title: Create a Random Matrix: FRC
### Aliases: RandMatFRC

### ** Examples


p <- 8
d <- 8
nmix <- 5
paramList <- list(p = p, d = d, nmix = nmix)
set.seed(4)
(a <- do.call(RandMatFRC, paramList))



