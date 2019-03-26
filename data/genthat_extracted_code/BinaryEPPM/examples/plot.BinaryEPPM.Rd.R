library(BinaryEPPM)


### Name: plot.BinaryEPPM
### Title: Diagnostic Plots for BinaryEPPM Objects
### Aliases: plot.BinaryEPPM
### Keywords: hplot

### ** Examples

## Not run: 
##D data("ropespores.case") 
##D output.fn <- BinaryEPPM(data = ropespores.case,
##D                   number.spores / number.tested ~ 1 + offset(logdilution),
##D                   model.type = 'p only', model.name = 'binomial')  
##D plot(output.fn, which = 1, type= "sdeviance")
## End(Not run)



