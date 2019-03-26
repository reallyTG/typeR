library(multiAssetOptions)


### Name: matrixFDM
### Title: Finite Difference Matrix Generator
### Aliases: matrixFDM

### ** Examples

# finite difference matrix for uniformly-spaced two-asset option
require("Matrix")
S1 <- list(seq(0, 5, by=1), seq(0, 5, by=1))
rf <- 0.1
q <- c(0.05, 0.04)
vol <- c(0.20, 0.25)
rho <- matrix(c(1,-0.5,-0.5,1), 2, 2)
matrixFDM(S1, rf, q, vol, rho)



