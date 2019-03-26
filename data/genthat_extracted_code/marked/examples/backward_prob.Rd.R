library(marked)


### Name: backward_prob
### Title: Computes backward probabilities
### Aliases: backward_prob
### Keywords: utility

### ** Examples

#
## No test: 
# This example is excluded from testing to reduce package check time
# cormack-jolly-seber model
data(dipper)
mod=crm(dipper,model="hmmcjs")
backward_prob(mod)
## End(No test)



