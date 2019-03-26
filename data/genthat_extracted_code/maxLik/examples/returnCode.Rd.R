library(maxLik)


### Name: returnCode
### Title: Success or failure of the optimization
### Aliases: returnCode returnCode.default returnCode.maxLik returnMessage
###   returnMessage.default returnMessage.maxim returnMessage.maxLik
### Keywords: methods utilities

### ** Examples

## maximise the exponential bell
f1 <- function(x) exp(-x^2)
a <- maxNR(f1, start=2)
returnCode(a) # should be success (1 or 2)
returnMessage(a)
## Now try to maximise log() function
a <- maxNR(log, start=2)
returnCode(a) # should give a failure (4)
returnMessage(a)



