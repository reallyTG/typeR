library(multimark)


### Name: processdata
### Title: Generate model inputs for fitting 'multimark' models
### Aliases: processdata

### ** Examples

## Don't show: 
test <- processdata(bobcat)
## End(Don't show)
## No test: 
# This example is excluded from testing to reduce package check time
# Example uses unrealistically low values for nchain, iter, and burnin

#Generate object of class "multimarksetup"
setup <- processdata(bobcat)

#Run single chain using the default model for bobcat data
bobcat.dot<-multimarkClosed(mms=setup)

#Run single chain for bobcat data with temporal effects (i.e., mod.p=~time)
bobcat.time <- multimarkClosed(mms=setup,mod.p=~time)
## End(No test)



