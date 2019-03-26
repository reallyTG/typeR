library(lineqGPR)


### Name: basisCompute.lineqGP
### Title: Hat Basis Functions for '"lineqGP"' Models
### Aliases: basisCompute.lineqGP

### ** Examples

x <- seq(0, 1, 0.01)
m <- 5
u <- seq(0, 1, 1/(m-1))
Phi <- basisCompute.lineqGP(x, u, d = 1)
matplot(Phi, type = "l", lty = 2, main = "Hat basis functions with m = 5")




