library(multimark)


### Name: multimarkClosed
### Title: Fit closed population abundance models for
###   capture-mark-recapture data consisting of multiple non-invasive marks
### Aliases: multimarkClosed

### ** Examples

## Don't show: 
test<-multimarkClosed(Enc.Mat=bobcat,data.type="never",iter=10,burnin=0,bin=5)
## End(Don't show)
## No test: 
# This example is excluded from testing to reduce package check time
# Example uses unrealistically low values for nchain, iter, and burnin

#Run single chain using the default model for bobcat data
bobcat.dot<-multimarkClosed(bobcat)

#Posterior summary for monitored parameters
summary(bobcat.dot$mcmc)
plot(bobcat.dot$mcmc)
## End(No test)



