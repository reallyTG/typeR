library(lmms)


### Name: lmmSpline
### Title: Data-driven linear mixed effect model spline modelling
### Aliases: lmmSpline

### ** Examples

## Not run: 
##D data(kidneySimTimeGroup)
##D # running for samples in group 1
##D G1 <- which(kidneySimTimeGroup$group=="G1")
##D testLMMSpline<- lmmSpline(data=kidneySimTimeGroup$data[G1,],time=kidneySimTimeGroup$time[G1],
##D                  sampleID=kidneySimTimeGroup$sampleID[G1])
##D summary(testLMMSpline)
##D DerivTestLMMSplineTG<- lmmSpline(data=as.data.frame(kidneySimTimeGroup$data[G1,]),
##D                        time=kidneySimTimeGroup$time[G1],sampleID=kidneySimTimeGroup$sampleID[G1],
##D                        deri=TRUE,basis="p-spline")
##D summary(DerivTestLMMSplineTG)
## End(Not run)



