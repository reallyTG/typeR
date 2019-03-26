library(multimark)


### Name: getdensityClosedSCR
### Title: Calculate population density estimates
### Aliases: getdensityClosedSCR

### ** Examples

## Don't show: 
sim.data<-simdataClosedSCR()
Enc.Mat<-sim.data$Enc.Mat
trapCoords<-sim.data$spatialInputs$trapCoords
studyArea<-sim.data$spatialInputs$studyArea
test<-getdensityClosedSCR(multimarkClosedSCR(Enc.Mat,trapCoords,studyArea,iter=10,burnin=0,bin=5))
## End(Don't show)
## No test: 
# This example is excluded from testing to reduce package check time
# Example uses unrealistically low values for nchain, iter, and burnin

#Run behavior model for simulated data with constant detection probability (i.e., mod.p=~c)
sim.data<-simdataClosedSCR()
Enc.Mat<-sim.data$Enc.Mat
trapCoords<-sim.data$spatialInputs$trapCoords
studyArea<-sim.data$spatialInputs$studyArea
example.dot <- multimarkClosedSCR(Enc.Mat,trapCoords,studyArea,mod.p=~1)
  
#Calculate capture and recapture probabilities
D <- getdensityClosedSCR(example.dot)
summary(D)
## End(No test)



