library(nlme)


### Name: formula.reStruct
### Title: Extract reStruct Object Formula
### Aliases: formula.reStruct
### Keywords: models

### ** Examples

rs1 <- reStruct(list(A = pdDiag(diag(2), ~age), B = ~1))
formula(rs1)



