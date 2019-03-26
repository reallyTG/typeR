library(RMark)


### Name: adjust.parameter.count
### Title: Adjust count of estimated parameters
### Aliases: adjust.parameter.count
### Keywords: utility

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
data(dipper)
ptime=list(formula=~time)
Phitime=list(formula=~time)
dipper.phitime.ptime=mark(dipper,model.parameters=list(Phi=Phitime, p=ptime))
dipper.phitime.ptime=adjust.parameter.count(dipper.phitime.ptime,11)
dipper.phitime.ptime=mark(dipper,model.parameters=list(Phi=Phitime, p=ptime),
                           adjust=FALSE)
## End(No test)



