library(multimark)


### Name: multimodelClosedSCR
### Title: Multimodel inference for 'multimark' spatial population
###   abundance models
### Aliases: multimodelClosedSCR

### ** Examples

## Don't show: 
sim.data<-simdataClosedSCR()
Enc.Mat<-sim.data$Enc.Mat
trapCoords<-sim.data$spatialInputs$trapCoords
studyArea<-sim.data$spatialInputs$studyArea
setup<-processdataSCR(Enc.Mat,trapCoords,studyArea)
test.dot<-multimarkClosedSCR(mms=setup,parms="all",iter=10,burnin=0,bin=5)
test<-multimodelClosedSCR(modlist=list(mod1=test.dot,mod2=test.dot))
## End(Don't show)
## No test: 
# This example is excluded from testing to reduce package check time
# Example uses unrealistically low values for nchain, iter, and burnin

#Generate object of class "multimarkSCRsetup"
sim.data<-simdataClosedSCR()
Enc.Mat<-sim.data$Enc.Mat
trapCoords<-sim.data$spatialInputs$trapCoords
studyArea<-sim.data$spatialInputs$studyArea
setup<-processdataSCR(Enc.Mat,trapCoords,studyArea)
 
#Run single chain using the default model for simulated data. Note parms="all".
example.dot <- multimarkClosedSCR(mms=setup,parms="all",iter=1000,adapt=500,burnin=500)

#Run single chain for simulated data with behavior effects. Note parms="all".
example.c <- multimarkClosedSCR(mms=setup,mod.p=~c,parms="all",iter=1000,adapt=500,burnin=500)

#Perform RJMCMC using defaults
modlist <- list(mod1=example.dot,mod2=example.c)
example.M <- multimodelClosedSCR(modlist=modlist,monparms=c("N","D","sigma2_scr"))

#Posterior model probabilities
example.M$pos.prob
 
#multimodel posterior summary for abundance and density
summary(example.M$rjmcmc[,c("N","D")])
## End(No test)



