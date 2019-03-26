library(nlme)


### Name: pdMatrix.reStruct
### Title: Extract Matrix or Square-Root Factor from Components of an
###   reStruct Object
### Aliases: pdMatrix.reStruct
### Keywords: models

### ** Examples

rs1 <- reStruct(pdSymm(diag(3), ~age+Sex, data = Orthodont))
pdMatrix(rs1)



