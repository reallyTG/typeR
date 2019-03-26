library(nlme)


### Name: pdFactor.reStruct
### Title: Extract Square-Root Factor from Components of an reStruct Object
### Aliases: pdFactor.reStruct
### Keywords: models

### ** Examples

rs1 <- reStruct(pdSymm(diag(3), ~age+Sex, data = Orthodont))
pdFactor(rs1)



