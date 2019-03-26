library(BinaryEPPM)


### Name: coef.BinaryEPPM
### Title: Extraction of model coefficients for BinaryEPPM Objects
### Aliases: coef.BinaryEPPM
### Keywords: methods

### ** Examples

data("ropespores.case")
output.fn <- BinaryEPPM(data = ropespores.case,
                  number.spores / number.tested ~ 1 + offset(logdilution))   
coef(output.fn, prtpar = "full")
coef(output.fn, prtpar = "p")
coef(output.fn, prtpar = "scale.factor")



