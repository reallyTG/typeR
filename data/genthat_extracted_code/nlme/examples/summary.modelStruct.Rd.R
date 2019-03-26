library(nlme)


### Name: summary.modelStruct
### Title: Summarize a modelStruct Object
### Aliases: summary.modelStruct summary.reStruct
### Keywords: models

### ** Examples

lms1 <- lmeStruct(reStruct = reStruct(pdDiag(diag(2), ~age)),
   corStruct = corAR1(0.3))
summary(lms1)



