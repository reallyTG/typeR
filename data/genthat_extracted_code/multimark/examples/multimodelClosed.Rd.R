library(multimark)


### Name: multimodelClosed
### Title: Multimodel inference for 'multimark' closed population abundance
###   models
### Aliases: multimodelClosed

### ** Examples

## Don't show: 
setup<-processdata(bobcat)
test.dot<-multimarkClosed(mms=setup,parms="all",iter=10,burnin=0,bin=5)
test<-multimodelClosed(modlist=list(mod1=test.dot,mod2=test.dot))
## End(Don't show)
## No test: 
# This example is excluded from testing to reduce package check time
# Example uses unrealistically low values for nchain, iter, and burnin

#Generate object of class "multimarksetup"
setup <- processdata(bobcat)
 
#Run single chain using the default model for bobcat data. Note parms="all".
bobcat.dot <- multimarkClosed(mms=setup,parms="all",iter=1000,adapt=500,burnin=500)

#Run single chain for bobcat data with time effects. Note parms="all".
bobcat.time <- multimarkClosed(mms=setup,mod.p=~time,parms="all",iter=1000,adapt=500,burnin=500)

#Perform RJMCMC using defaults
modlist <- list(mod1=bobcat.dot,mod2=bobcat.time)
bobcat.M <- multimodelClosed(modlist=modlist,monparms=c("N","p"))

#Posterior model probabilities
bobcat.M$pos.prob
 
#multimodel posterior summary for abundance
summary(bobcat.M$rjmcmc[,"N"])
## End(No test)



