library(lmms)


### Name: deriv.lmmspline
### Title: Derivative information for 'lmmspline' objects
### Aliases: deriv.lmmspline

### ** Examples

## Not run: 
##D data(kidneySimTimeGroup)
##D # run lmmSpline on the samples from group 1 only
##D G1 <- which(kidneySimTimeGroup$group=="G1")
##D testLMMSplineTG<- lmmSpline(data=kidneySimTimeGroup$data[G1,],
##D                   time=kidneySimTimeGroup$time[G1],
##D                   sampleID=kidneySimTimeGroup$sampleID[G1],
##D                   basis="p-spline",keepModels=T)
##D testLMMSplineTGDeri <- deriv(testLMMSplineTG)
##D summary(testLMMSplineTGDeri)
## End(Not run)



