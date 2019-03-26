library(RMark)


### Name: PIMS
### Title: Display PIM for a parameter
### Aliases: PIMS
### Keywords: utility

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
data(dipper)
results=mark(dipper)
PIMS(results,"Phi")
PIMS(results,"Phi",simplified=FALSE)
## End(No test) 



