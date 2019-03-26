library(ShrinkCovMat)


### Name: shrinkcovmat.unequal
### Title: Shrinking the Sample Covariance Matrix Towards a Diagonal Matrix
###   with Diagonal Elements the Sample Variances.
### Aliases: shrinkcovmat.unequal

### ** Examples

data(colon)
NormalGroup <- colon[, 1:40]
TumorGroup <- colon[, 41:62]
Sigmahat.NormalGroup <- shrinkcovmat.unequal(NormalGroup)
Sigmahat.NormalGroup
Sigmahat.TumorGroup <- shrinkcovmat.unequal(TumorGroup)
Sigmahat.TumorGroup



