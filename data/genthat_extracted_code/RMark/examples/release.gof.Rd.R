library(RMark)


### Name: release.gof
### Title: Runs RELEASE for goodness of fit test
### Aliases: release.gof
### Keywords: utility

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
data(dipper)
dipper.processed=process.data(dipper,groups=("sex"))
release.gof(dipper.processed)
## End(No test)



