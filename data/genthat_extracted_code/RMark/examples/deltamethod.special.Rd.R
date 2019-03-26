library(RMark)


### Name: deltamethod.special
### Title: Compute delta method variance for sum, cumsum, prod and cumprod
###   functions
### Aliases: deltamethod.special
### Keywords: utility

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
#
# The following are examples only to demonstrate selecting different 
# model sets for adjusting chat and showing model selection table. 
# It is not a realistic analysis.
#
  data(dipper)
  mod=mark(dipper,model.parameters=list(Phi=list(formula=~time)))
  rr=get.real(mod,"Phi",se=TRUE,vcv=TRUE)
  deltamethod.special("prod",rr$estimates$estimate[1:6],rr$vcv.real)
  deltamethod.special("cumprod",rr$estimates$estimate[1:6],rr$vcv.real,ses=FALSE)
  deltamethod.special("sum",rr$estimates$estimate[1:6],rr$vcv.real)
  deltamethod.special("cumsum",rr$estimates$estimate[1:6],rr$vcv.real,ses=FALSE)
## End(No test)



