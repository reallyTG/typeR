library(lmms)


### Name: summary.lmmspline
### Title: Summary of a 'lmmspline' Object
### Aliases: summary.lmmspline

### ** Examples

## Not run: 
##D data(kidneySimTimeGroup)
##D # running for samples in group 1
##D G1 <- which(kidneySimTimeGroup$group=="G1")
##D testLMMSplineTG<- lmmSpline(data=kidneySimTimeGroup$data[G1,],
##D                   time=kidneySimTimeGroup$time[G1],
##D                   sampleID=kidneySimTimeGroup$sampleID[G1])
##D summary(testLMMSplineTG)
## End(Not run)



