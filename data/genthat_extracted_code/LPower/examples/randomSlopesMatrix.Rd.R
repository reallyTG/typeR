library(LPower)


### Name: randomSlopesMatrix
### Title: Creates the xMatrix and zMatrix, and attrition rates for a two
###   treatment clinical trial analyzed using the random slopes model.
### Aliases: randomSlopesMatrix
### Keywords: ~design

### ** Examples

vars=randomSlopesMatrix(list(c(0,1,2,4,6),c(0,1,2,4,6)),
                matrix(c(31.8,.8527,.8527,.6687),2,2),2.7085,.02)
LPower(sample_size=40,power=.8,xMatrix=vars$xMatrix,
vMatrix=vars$vMatrix,attritionRates=vars$attritionRates)



