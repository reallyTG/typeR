library(multimark)


### Name: markClosedSCR
### Title: Fit spatial population abundance models for "traditional"
###   capture-mark-recapture data consisting of a single mark type
### Aliases: markClosedSCR

### ** Examples

## Don't show: 
sim.data<-simdataClosedSCR(delta_1=1,delta_2=0)
Enc.Mat<-sim.data$Enc.Mat
trapCoords<-sim.data$spatialInputs$trapCoords
studyArea<-sim.data$spatialInputs$studyArea
test<-markClosedSCR(Enc.Mat,trapCoords,studyArea,iter=10,burnin=0,bin=5)
## End(Don't show)
## No test: 
# This example is excluded from testing to reduce package check time
# Example uses unrealistically low values for nchain, iter, and burnin

#Run single chain using the default model for ``traditional'' tiger data of Royle et al (2009)
Enc.Mat<-tiger$Enc.Mat
trapCoords<-tiger$trapCoords
studyArea<-tiger$studyArea
tiger.dot<-markClosedSCR(Enc.Mat,trapCoords,studyArea,iter=100,adapt=50,burnin=50)

#Posterior summary for monitored parameters
summary(tiger.dot$mcmc)
plot(tiger.dot$mcmc)
## End(No test)



