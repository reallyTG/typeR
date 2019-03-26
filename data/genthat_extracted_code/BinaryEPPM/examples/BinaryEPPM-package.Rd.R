library(BinaryEPPM)


### Name: BinaryEPPM-package
### Title: Mean and Variance Modeling of Binary Data
### Aliases: BinaryEPPM-package
### Keywords: package

### ** Examples

data("ropespores.case")
output.fn <- BinaryEPPM(data = ropespores.case,
                  number.spores / number.tested ~ 1 + offset(logdilution),
                  model.type = 'p only', model.name = 'binomial')                 
summary(output.fn) 



