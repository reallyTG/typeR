library(multimark)


### Name: tiger
### Title: Tiger data
### Aliases: tiger
### Keywords: data

### ** Examples

data(tiger)
#plot the traps and available habitat within the study area
plotSpatialData(trapCoords=tiger$trapCoords,studyArea=tiger$studyArea)
## No test: 
# This example is excluded from testing to reduce package check time
# Example uses unrealistically low values for nchain, iter, and burnin

# Fit spatial model to tiger data
Enc.Mat<-tiger$Enc.Mat
trapCoords<-tiger$trapCoords
studyArea<-tiger$studyArea
tiger.dot<-markClosedSCR(Enc.Mat,trapCoords,studyArea,iter=100,adapt=50,burnin=50)
summary(tiger.dot$mcmc)
## End(No test)



