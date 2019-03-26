library(nlme)


### Name: coef.modelStruct
### Title: Extract modelStruct Object Coefficients
### Aliases: coef.modelStruct coef<-.modelStruct
### Keywords: models

### ** Examples

lms1 <- lmeStruct(reStruct = reStruct(pdDiag(diag(2), ~age)),
   corStruct = corAR1(0.3))
coef(lms1)



