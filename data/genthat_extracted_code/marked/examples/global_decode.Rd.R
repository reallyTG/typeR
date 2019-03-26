library(marked)


### Name: global_decode
### Title: Global decoding of HMM
### Aliases: global_decode
### Keywords: utility

### ** Examples

#
## No test: 
# This example is excluded from testing to reduce package check time
# cormack-jolly-seber model
data(dipper)
mod=crm(dipper,model="hmmcjs")
global_decode(mod)
## End(No test)



