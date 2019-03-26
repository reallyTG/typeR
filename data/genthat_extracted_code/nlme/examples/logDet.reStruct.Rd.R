library(nlme)


### Name: logDet.reStruct
### Title: Extract reStruct Log-Determinants
### Aliases: logDet.reStruct
### Keywords: models

### ** Examples

rs1 <- reStruct(list(A = pdSymm(diag(1:3), form = ~Score),
  B = pdDiag(2 * diag(4), form = ~Educ)))
logDet(rs1)



