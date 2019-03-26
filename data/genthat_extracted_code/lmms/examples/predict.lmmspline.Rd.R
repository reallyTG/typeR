library(lmms)


### Name: predict.lmmspline
### Title: Predicts fitted values of an 'lmmspline' Object
### Aliases: predict.lmmspline

### ** Examples

## Not run: 
##D data(kidneySimTimeGroup)
##D G1 <- which(kidneySimTimeGroup$group=="G1")
##D testLMMSpline<- lmmSpline(data=kidneySimTimeGroup$data[G1,],
##D                  time=kidneySimTimeGroup$time[G1],
##D                  sampleID=kidneySimTimeGroup$sampleID[G1],keepModels=T)
##D mat.predict <- predict(testLMMSpline, timePredict=c(seq(1,4, by=0.5)))
## End(Not run)



