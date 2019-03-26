library(fdapace)


### Name: predict.FPCA
### Title: Predict FPC scores for a new sample given an FPCA object
### Aliases: predict.FPCA

### ** Examples

set.seed(1)
n <- 20
pts <- seq(0, 1, by=0.05)
sampWiener <- Wiener(n, pts)
sampWiener <- Sparsify(sampWiener, pts, 10)
res <- FPCA(sampWiener$Ly, sampWiener$Lt)
res




