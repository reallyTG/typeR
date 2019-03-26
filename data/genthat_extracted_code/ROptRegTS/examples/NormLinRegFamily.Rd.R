library(ROptRegTS)


### Name: NormLinRegFamily
### Title: Generating function for linear regression family
### Aliases: NormLinRegFamily
### Keywords: models robust

### ** Examples

(LM1 <- NormLinRegFamily(Reg2Mom = matrix(1)))
Map(L2deriv(LM1)[[1]])
FisherInfo(LM1)
checkL2deriv(LM1)



