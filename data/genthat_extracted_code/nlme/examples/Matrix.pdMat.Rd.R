library(nlme)


### Name: Matrix.pdMat
### Title: Assign Matrix to a pdMat or pdBlocked Object
### Aliases: matrix<-.pdMat matrix<-.pdBlocked
### Keywords: models

### ** Examples

class(pd1 <- pdSymm(diag(3))) # "pdSymm" "pdMat"
matrix(pd1) <- diag(1:3)
pd1



