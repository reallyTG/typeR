library(multimark)


### Name: processdataSCR
### Title: Generate model inputs for fitting spatial 'multimark' models
### Aliases: processdataSCR

### ** Examples

## Don't show: 
sim.data<-simdataClosedSCR()
Enc.Mat <- sim.data$Enc.Mat
trapCoords <- sim.data$spatialInputs$trapCoords
studyArea <- sim.data$spatialInputs$studyArea
setup <- processdataSCR(Enc.Mat,trapCoords,studyArea)
## End(Don't show)
## No test: 
# This example is excluded from testing to reduce package check time
# Example uses unrealistically low values for nchain, iter, and burnin

#Generate object of class "multimarksetup" from simulated data
sim.data<-simdataClosedSCR()
Enc.Mat <- sim.data$Enc.Mat
trapCoords <- sim.data$spatialInputs$trapCoords
studyArea <- sim.data$spatialInputs$studyArea
setup <- processdataSCR(Enc.Mat,trapCoords,studyArea)

#Run single chain using the default model for simulated data
example.dot<-multimarkClosedSCR(mms=setup)
## End(No test)




