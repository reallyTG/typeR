library(multimark)


### Name: markClosed
### Title: Fit closed population abundance models for "traditional"
###   capture-mark-recapture data consisting of a single mark type
### Aliases: markClosed

### ** Examples

## Don't show: 
test<-markClosed(Enc.Mat=simdataClosed(delta_1=1,delta_2=0)$Enc.Mat,iter=10,burnin=0,bin=5)
## End(Don't show)
## No test: 
# This example is excluded from testing to reduce package check time
# Example uses unrealistically low values for nchain, iter, and burnin

#Run single chain using the default model for simulated ``traditional'' data
data<-simdataClosed(delta_1=1,delta_2=0)$Enc.Mat
sim.dot<-markClosed(data)

#Posterior summary for monitored parameters
summary(sim.dot$mcmc)
plot(sim.dot$mcmc)
## End(No test)



