library(BinaryEPPM)


### Name: vcov.BinaryEPPM
### Title: Variance/Covariance Matrix for Coefficients
### Aliases: vcov.BinaryEPPM
### Keywords: models

### ** Examples

data("ropespores.case") 
output.fn <- BinaryEPPM(data = ropespores.case,
                  number.spores / number.tested ~ 1 + offset(logdilution),
                  model.type = 'p only', model.name = 'binomial')   
vcov(output.fn)



