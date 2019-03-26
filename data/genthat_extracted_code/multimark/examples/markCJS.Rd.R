library(multimark)


### Name: markCJS
### Title: Fit open population survival models for "traditional"
###   capture-mark-recapture data consisting of a single mark type
### Aliases: markCJS

### ** Examples

## Don't show: 
data<-simdataCJS(delta_1=1,delta_2=0)$Enc.Mat
test<-markCJS(data,iter=10,burnin=0)
test.age <- markCJS(data,mod.phi=~age,iter=10,burnin=0,parameters=list(Phi=list(age.bins=c(0,1,4))),right=FALSE)
## End(Don't show)
## No test: 
# These examples are excluded from testing to reduce package check time
# Example uses unrealistically low values for nchain, iter, and burnin

#Simulate open population data using defaults
data <- simdataCJS(delta_1=1,delta_2=0)$Enc.Mat

#Fit default open population model
sim.dot <- markCJS(data)

#Posterior summary for monitored parameters
summary(sim.dot$mcmc)
plot(sim.dot$mcmc)

#Fit ``age'' model with 2 age classes (e.g., juvenile and adult) for survival
#using 'parameters' and 'right' arguments from RMark::make.design.data
sim.age <- markCJS(data,mod.phi=~age,
           parameters=list(Phi=list(age.bins=c(0,1,4))),right=FALSE)
summary(getprobsCJS(sim.age))
## End(No test)



