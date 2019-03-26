library(XR)


### Name: getInterface
### Title: Get or start an evaluator for an interface
### Aliases: getInterface evaluatorTable rmInterface evaluatorNumber

### ** Examples

## the current evaluator, or NULL if none exists
getInterface()
## this will always be NULL, because no evaluator has this class
getInterface("Interface", .makeNew = FALSE)



