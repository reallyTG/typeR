library(eDMA)


### Name: SimulateDLM
### Title: Simulate from DLM of West and Harrison (1999).
### Aliases: SimulateDLM

### ** Examples


set.seed(7892)

iT <- 500
iK <- 3

dV <- 0.1
mW <- diag(iK + 1) * 0.01
dPhi <- 1

vBeta0 <- rep(0, iK + 1)
mX <- cbind(1, matrix(rnorm(iT * (iK)), iT, iK))

lOut <- SimulateDLM(iT, mX, vBeta0, mW, dV, dPhi)
vY <- lOut$vY




