library(multimark)


### Name: getprobsClosedSCR
### Title: Calculate posterior capture and recapture probabilities
### Aliases: getprobsClosedSCR

### ** Examples

## Don't show: 
sim.data<-simdataClosedSCR()
Enc.Mat<-sim.data$Enc.Mat
trapCoords<-sim.data$spatialInputs$trapCoords
studyArea<-sim.data$spatialInputs$studyArea
test<-getprobsClosedSCR(multimarkClosedSCR(Enc.Mat,trapCoords,studyArea,iter=10,burnin=0,bin=5))
## End(Don't show)
## No test: 
# This example is excluded from testing to reduce package check time
# Example uses unrealistically low values for nchain, iter, and burnin

#Run behavior model for simulated data with constant detection probability (i.e., mod.p=~c)
sim.data<-simdataClosedSCR()
Enc.Mat<-sim.data$Enc.Mat
trapCoords<-sim.data$spatialInputs$trapCoords
studyArea<-sim.data$spatialInputs$studyArea
example.c <- multimarkClosedSCR(Enc.Mat,trapCoords,studyArea,mod.p=~c,
                                iter=1000,adapt=500,burnin=500)
  
#Calculate capture and recapture probabilities
pc <- getprobsClosedSCR(example.c)
summary(pc)
## End(No test)



