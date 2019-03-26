library(fdapace)


### Name: fitted.FPCAder
### Title: Fitted functional sample from FPCAder object
### Aliases: fitted.FPCAder

### ** Examples

set.seed(1)
n <- 20
pts <- seq(0, 1, by=0.05)
sampWiener <- Wiener(n, pts)
sampWiener <- Sparsify(sampWiener, pts, 10)



