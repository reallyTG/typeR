library(ShrinkCovMat)


### Name: shrinkcovmat.identity
### Title: Shrinking the Sample Covariance Matrix Towards the Identity
###   Matrix
### Aliases: shrinkcovmat.identity

### ** Examples

data(colon)
NormalGroup <- colon[, 1:40]
TumorGroup <- colon[, 41:62]
Sigmahat.NormalGroup <- shrinkcovmat.identity(NormalGroup)
Sigmahat.NormalGroup
Sigmahat.TumorGroup <- shrinkcovmat.identity(TumorGroup)
Sigmahat.TumorGroup



