library(nlme)


### Name: corMatrix.reStruct
### Title: Extract Correlation Matrix from Components of an reStruct Object
### Aliases: corMatrix.reStruct
### Keywords: models

### ** Examples

rs1 <- reStruct(pdSymm(diag(3), ~age+Sex, data = Orthodont))
corMatrix(rs1)



