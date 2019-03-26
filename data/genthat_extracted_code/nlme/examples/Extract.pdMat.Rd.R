library(nlme)


### Name: [.pdMat
### Title: Subscript a pdMat Object
### Aliases: [.pdMat [.pdBlocked [<-.pdMat
### Keywords: models

### ** Examples

pd1 <- pdSymm(diag(3))
pd1[1, , drop = FALSE]
pd1[1:2, 1:2] <- 3 * diag(2)



