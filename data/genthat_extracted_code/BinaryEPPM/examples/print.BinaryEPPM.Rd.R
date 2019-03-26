library(BinaryEPPM)


### Name: print.BinaryEPPM
### Title: Printing of BinaryEPPM Objects
### Aliases: print.BinaryEPPM
### Keywords: IO

### ** Examples

data("ropespores.case") 
output.fn <- BinaryEPPM(data = ropespores.case,
                  number.spores / number.tested ~ 1 + offset(logdilution),
                  model.type = 'p only', model.name = 'binomial')   
print(output.fn)



