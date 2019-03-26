library(ShrinkCovMat)


### Name: ShrinkCovMat-package
### Title: Shrinkage Covariance Matrix Estimators
### Aliases: ShrinkCovMat-package ShrinkCovMat
### Keywords: package

### ** Examples

data(colon)
## Estimating the covariance matrix for the
## normal tissue group.
NormalGroup <- colon[, 1:40]
Sigmahat1 <- shrinkcovmat.equal(NormalGroup)
Sigmahat1
Sigmahat2 <- shrinkcovmat.identity(NormalGroup)
Sigmahat2
Sigmahat3 <- shrinkcovmat.unequal(NormalGroup)
Sigmahat3



