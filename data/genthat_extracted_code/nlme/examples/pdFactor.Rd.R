library(nlme)


### Name: pdFactor
### Title: Square-Root Factor of a Positive-Definite Matrix
### Aliases: pdFactor pdFactor.pdBlocked pdFactor.pdCompSymm
###   pdFactor.pdDiag pdFactor.pdIdent pdFactor.pdMat pdFactor.pdNatural
###   pdFactor.pdSymm pdFactor.pdLogChol
### Keywords: models

### ** Examples

pd1 <- pdCompSymm(4 * diag(3) + 1)
pdFactor(pd1)



