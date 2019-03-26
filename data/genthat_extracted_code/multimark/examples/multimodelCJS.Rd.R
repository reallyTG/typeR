library(multimark)


### Name: multimodelCJS
### Title: Multimodel inference for 'multimark' open population survival
###   models
### Aliases: multimodelCJS

### ** Examples

## Don't show: 
setup<-processdata(bobcat)
test.dot<-multimarkCJS(mms=setup,parms="all",iter=10,burnin=0)
test<-multimodelCJS(modlist=list(mod1=test.dot,mod2=test.dot))
set.seed(10)
## End(Don't show)
## No test: 
# This example is excluded from testing to reduce package check time
# Example uses unrealistically low values for nchain, iter, and burnin

#Generate object of class "multimarksetup" from simulated data
data_type = "always"
noccas <- 5
phibetaTime <- seq(2,0,length=noccas-1) # declining trend in survival
data <- simdataCJS(noccas=5,phibeta=phibetaTime,data.type=data_type)
setup <- processdata(data$Enc.Mat,data.type=data_type)

#Run single chain using the default model. Note parms="all".
sim.pdot.phidot <- multimarkCJS(mms=setup,parms="all",iter=1000,adapt=500,burnin=500)

#Run single chain with temporal trend for phi. Note parms="all".
sim.pdot.phiTime <- multimarkCJS(mms=setup,mod.phi=~Time,parms="all",iter=1000,adapt=500,burnin=500)

#Perform RJMCMC using defaults
modlist <- list(mod1=sim.pdot.phidot,mod2=sim.pdot.phiTime)
sim.M <- multimodelCJS(modlist=modlist)

#Posterior model probabilities
sim.M$pos.prob

#multimodel posterior summary for survival (display first cohort only)
summary(sim.M$rjmcmc[,paste0("phi[1,",1:(noccas-1),"]")])
## End(No test)



