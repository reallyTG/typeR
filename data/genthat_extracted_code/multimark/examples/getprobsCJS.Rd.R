library(multimark)


### Name: getprobsCJS
### Title: Calculate posterior capture and survival probabilities
### Aliases: getprobsCJS

### ** Examples

## Don't show: 
test<-getprobsCJS(multimarkCJS(Enc.Mat=bobcat,data.type="never",iter=10,burnin=0))
## End(Don't show)
## No test: 
# This example is excluded from testing to reduce package check time
# Example uses unrealistically low values for nchain, iter, and burnin

#Simulate open population data with temporal variation in survival
noccas <- 5
data <- simdataCJS(noccas=noccas, phibeta=rnorm(noccas-1,1.6,0.1))
 
#Fit open population model with temporal variation in survival
sim.time <- multimarkCJS(data$Enc.Mat,mod.phi=~time)
    
#Calculate capture and survival probabilities for each cohort and time
pphi <- getprobsCJS(sim.time)
summary(pphi)
## End(No test)



