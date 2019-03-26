library(BinaryEPPM)


### Name: BinaryEPPM
### Title: Fitting of EPPM models to binary data.
### Aliases: BinaryEPPM
### Keywords: models

### ** Examples

data("ropespores.case") 
output.fn <- BinaryEPPM(data = ropespores.case,
                  number.spores / number.tested ~ 1 + offset(logdilution),
                  model.type = "p only", model.name = "binomial")   
summary(output.fn)



