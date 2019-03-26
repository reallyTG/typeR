library(lmms)


### Name: plot.lmmspline
### Title: Plot of 'lmmspline' object
### Aliases: plot.lmmspline

### ** Examples

## Not run: 
##D data(kidneySimTimeGroup)
##D # running for samples in group 1
##D G1 <- which(kidneySimTimeGroup$group=="G1")
##D testLmmspline <- lmmSpline(data=kidneySimTimeGroup$data[G1,],
##D                  time=kidneySimTimeGroup$time[G1],
##D                  sampleID=kidneySimTimeGroup$sampleID[G1],keepModels=T)
##D                  
##D          
##D plot(testLmmspline, y=2)
##D plot(testLmmspline, y=2, smooth=TRUE)
##D # Don't keep the models to improve memory usage 
##D testLmmspline <- lmmSpline(data=kidneySimTimeGroup$data[G1,],
##D                  time=kidneySimTimeGroup$time[G1],
##D                  sampleID=kidneySimTimeGroup$sampleID[G1],keepModels=F)
##D                  
##D #plot only the fitted values
##D plot(testLmmspline, y=2)
##D #plot fitted values with original data
##D plot(testLmmspline, y=2, data=kidneySimTimeGroup$data[G1,], time=kidneySimTimeGroup$time[G1])
##D 
## End(Not run)



