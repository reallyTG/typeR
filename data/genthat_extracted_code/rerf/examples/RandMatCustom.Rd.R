library(rerf)


### Name: RandMatCustom
### Title: Create a Random Matrix: custom
### Aliases: RandMatCustom

### ** Examples


p <- 28
d <- 8
nnzSample <- 1:8
nnzProb <- 1 / 36 * 1:8
paramList <- list(p = p, d = d, nnzSample, nnzProb)
set.seed(8)
(a <- do.call(RandMatCustom, paramList))



