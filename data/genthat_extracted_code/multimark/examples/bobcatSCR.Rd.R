library(multimark)


### Name: bobcatSCR
### Title: Bobcat spatial capture-recapture data
### Aliases: bobcatSCR
### Keywords: data

### ** Examples

data(bobcatSCR)
#plot the traps and available habitat within the study area
plotSpatialData(trapCoords=bobcatSCR$trapCoords,studyArea=bobcatSCR$studyArea)
## No test: 
# This example is excluded from testing to reduce package check time
# Example uses unrealistically low values for nchain, iter, and burnin

# Fit spatial model to tiger data
Enc.Mat <- bobcatSCR$Enc.Mat
trapCoords <- bobcatSCR$trapCoords
studyArea <- bobcatSCR$studyArea

# specify known encounter histories
known <- c(rep(1,15),rep(0,nrow(Enc.Mat)-15))

# specify prior bounds for sigma2_scr
sig_bounds <- c(0.01,max(diff(range(studyArea[,"x"])),diff(range(studyArea[,"y"]))))

mmsSCR <- processdataSCR(Enc.Mat,trapCoords,studyArea,known=known)
bobcatSCR.dot.type <- multimarkClosedSCR(mms=mmsSCR,iter=200,adapt=100,burnin=100,
                                         sigma_bounds=sig_bounds)
summary(bobcatSCR.dot.type$mcmc)
## End(No test)



