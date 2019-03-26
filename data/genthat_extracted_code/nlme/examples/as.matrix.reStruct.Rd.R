library(nlme)


### Name: as.matrix.reStruct
### Title: Matrices of an reStruct Object
### Aliases: as.matrix.reStruct
### Keywords: models

### ** Examples

rs1 <- reStruct(pdSymm(diag(3), ~age+Sex, data = Orthodont))
as.matrix(rs1)



