library(ShrinkCovMat)


### Name: shrinkcovmat.equal
### Title: Shrinking the Sample Covariance Matrix Towards a Diagonal Matrix
###   with Equal Diagonal Elements
### Aliases: shrinkcovmat.equal

### ** Examples

data(colon)
NormalGroup <- colon[, 1:40]
TumorGroup <- colon[, 41:62]
Sigmahat.NormalGroup <- shrinkcovmat.equal(NormalGroup)
Sigmahat.NormalGroup
Sigmahat.TumorGroup <- shrinkcovmat.equal(TumorGroup)
Sigmahat.TumorGroup



