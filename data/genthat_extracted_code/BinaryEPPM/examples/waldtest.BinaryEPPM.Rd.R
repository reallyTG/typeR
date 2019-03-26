library(BinaryEPPM)


### Name: waldtest.BinaryEPPM
### Title: Wald Test of Nested Models for BinaryEPPM Objects
### Aliases: waldtest.BinaryEPPM
### Keywords: methods

### ** Examples

## Not run: 
##D data("ropespores.case") 
##D output.fn <- BinaryEPPM(data = ropespores.case,
##D   number.spores / number.tested ~ 1 + offset(logdilution),
##D   model.type = 'p only', model.name = 'binomial')  
##D output.fn.one <- BinaryEPPM(data = ropespores.case,
##D   number.spores / number.tested ~ 1 + offset(logdilution),
##D   model.type = 'p only', model.name = 'beta binomial')   
##D waldtest(output.fn, output.fn.one, test = c("Chisq", "F"),
##D   vcov =  vcov)        
## End(Not run)



