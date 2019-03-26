library(rerf)


### Name: RandMatRF
### Title: Create a Random Matrix: Random Forest (RF)
### Aliases: RandMatRF

### ** Examples


p <- 8
d <- 3
paramList <- list(p = p, d = d)
set.seed(4)
(a <- do.call(RandMatRF, paramList))



