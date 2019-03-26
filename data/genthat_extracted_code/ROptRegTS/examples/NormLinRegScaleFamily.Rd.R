library(ROptRegTS)


### Name: NormLinRegScaleFamily
### Title: Generating Function for Linear Regression Family with Unknown
###   Scale
### Aliases: NormLinRegScaleFamily
### Keywords: models robust

### ** Examples

(LM1 <- NormLinRegScaleFamily(Reg2Mom = matrix(1)))
Map(L2deriv(LM1)[[1]])
FisherInfo(LM1)
checkL2deriv(LM1)



