library(multimark)


### Name: multimarkClosedSCR
### Title: Fit spatially-explicit population abundance models for
###   capture-mark-recapture data consisting of multiple non-invasive marks
### Aliases: multimarkClosedSCR

### ** Examples

## Don't show: 
sim.data<-simdataClosedSCR(N=30,noccas=5,ntraps=4)
Enc.Mat <- sim.data$Enc.Mat
trapCoords <- sim.data$spatialInputs$trapCoords
studyArea <- sim.data$spatialInputs$studyArea
test<-multimarkClosedSCR(Enc.Mat,trapCoords,studyArea,iter=10,burnin=0,bin=5)
## End(Don't show)
## No test: 
# This example is excluded from testing to reduce package check time
# Example uses unrealistically low values for nchain, iter, and burnin

#Generate object of class "multimarkSCRsetup" from simulated data
sim.data<-simdataClosedSCR()
Enc.Mat <- sim.data$Enc.Mat
trapCoords <- sim.data$spatialInputs$trapCoords
studyArea <- sim.data$spatialInputs$studyArea

#Run single chain using the default model for simulated data
example.dot<-multimarkClosedSCR(Enc.Mat,trapCoords,studyArea)

#Posterior summary for monitored parameters
summary(example.dot$mcmc)
plot(example.dot$mcmc)
## End(No test)



