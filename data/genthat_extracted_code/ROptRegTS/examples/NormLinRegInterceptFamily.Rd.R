library(ROptRegTS)


### Name: NormLinRegInterceptFamily
### Title: Generating Function for Linear Regression Family with Unknown
###   Intercept
### Aliases: NormLinRegInterceptFamily
### Keywords: models robust

### ** Examples

(LM1 <- NormLinRegInterceptFamily(Reg2Mom = matrix(1)))
Map(L2deriv(LM1)[[1]])
FisherInfo(LM1)
checkL2deriv(LM1)



