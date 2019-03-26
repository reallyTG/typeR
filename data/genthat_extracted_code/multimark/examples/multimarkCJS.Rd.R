library(multimark)


### Name: multimarkCJS
### Title: Fit open population survival models for capture-mark-recapture
###   data consisting of multiple non-invasive marks
### Aliases: multimarkCJS

### ** Examples

## Don't show: 
test<-multimarkCJS(Enc.Mat=bobcat,data.type="never",iter=10,burnin=0)
test.age <- multimarkCJS(Enc.Mat=bobcat,mod.phi=~age,iter=10,burnin=0,parameters=list(Phi=list(age.bins=c(0,1,7))),right=FALSE)
## End(Don't show)
## No test: 
# This example is excluded from testing to reduce package check time
# Example uses unrealistically low values for nchain, iter, and burnin

#Simulate open population data using defaults
data <- simdataCJS()

#Fit default open population model
sim.dot <- multimarkCJS(data$Enc.Mat)

#Posterior summary for monitored parameters
summary(sim.dot$mcmc)
plot(sim.dot$mcmc)

#' #Fit ``age'' model with 2 age classes (e.g., juvenile and adult) for survival
#using 'parameters' and 'right' arguments from RMark::make.design.data
sim.age <- multimarkCJS(data$Enc.Mat,mod.phi=~age,
           parameters=list(Phi=list(age.bins=c(0,1,4))),right=FALSE)
summary(getprobsCJS(sim.age))
## End(No test)



