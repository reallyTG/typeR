library(BinaryEPPM)


### Name: cooks.distance.BinaryEPPM
### Title: Cook's distance for BinaryEPPM Objects
### Aliases: cooks.distance.BinaryEPPM
### Keywords: methods

### ** Examples

data("ropespores.case") 
output.fn <- BinaryEPPM(data = ropespores.case,
                  number.spores / number.tested ~ 1 + offset(logdilution),
                  model.type = 'p only', model.name = 'binomial')   
cooks.distance(output.fn)



