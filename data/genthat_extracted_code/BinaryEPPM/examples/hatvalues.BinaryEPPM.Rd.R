library(BinaryEPPM)


### Name: hatvalues.BinaryEPPM
### Title: Extraction of hat matrix values from BinaryEPPM Objects
### Aliases: hatvalues.BinaryEPPM
### Keywords: methods

### ** Examples

data("ropespores.case") 
output.fn <- BinaryEPPM(data = ropespores.case,
                  number.spores / number.tested ~ 1 + offset(logdilution),
                  model.type = 'p only', model.name = 'binomial')   
hatvalues(output.fn)



