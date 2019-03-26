library(nlme)


### Name: coef.reStruct
### Title: reStruct Object Coefficients
### Aliases: coef.reStruct coef<-.reStruct
### Keywords: models

### ** Examples

rs1 <- reStruct(list(A = pdSymm(diag(1:3), form = ~Score),
  B = pdDiag(2 * diag(4), form = ~Educ)))
coef(rs1)



