library(marked)


### Name: local_decode
### Title: Local decoding of HMM
### Aliases: local_decode
### Keywords: utility

### ** Examples

#
## No test: 
# This example is excluded from testing to reduce package check time
# cormack-jolly-seber model
data(dipper)
mod=crm(dipper,model="hmmcjs")
local_decode(mod)
## End(No test)



