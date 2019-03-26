library(rerf)


### Name: RandMatFRCN
### Title: Create a Random Matrix: FRCN
### Aliases: RandMatFRCN

### ** Examples


p <- 8
d <- 8
nmix <- 5
paramList <- list(p = p, d = d, nmix = nmix)
set.seed(8)
(a <- do.call(RandMatFRCN, paramList))



