library(eDMA)


### Name: SimData
### Title: data: Simulated data from DLM of West and Harrison (1999).
### Aliases: SimData
### Keywords: datasets

### ** Examples


#the data set has been generated as:

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

mX <- mX[, -1]

iK_Add <- 2

mX_add <- matrix(rnorm(iT * iK_Add), iT, iK_Add)

SimData <- cbind(y = vY, mX, mX_add)
colnames(SimData) <- c("y", paste("x", 2:(iK + iK_Add + 1), sep = ""))




