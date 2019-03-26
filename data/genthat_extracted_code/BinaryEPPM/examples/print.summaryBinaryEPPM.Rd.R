library(BinaryEPPM)


### Name: print.summaryBinaryEPPM
### Title: Printing of summaryBinaryEPPM Objects
### Aliases: print.summaryBinaryEPPM
### Keywords: IO

### ** Examples

data("ropespores.case") 
output.fn <- BinaryEPPM(data = ropespores.case,
                  number.spores / number.tested ~ 1 + offset(logdilution),
                  model.type = 'p only', model.name = 'binomial')   
print(summary(output.fn))



