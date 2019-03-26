library(kml)


### Name: ParKml-class
### Title: ~ Class: "ParKml" ~
### Aliases: ParKml-class [,ParKml-method [<-,ParKml-method
### Keywords: classes

### ** Examples

## No test: 
### Building data
myCld <- gald()

### Standard kml
kml(myCld,,3,toPlot="both")

### Using median instead of mean
parWithMedian <- parALGO(centerMethod=function(x){median(x,na.rm=TRUE)})
kml(myCld,,3,toPlot="both",parAlgo=parWithMedian)

### Using distance max
parWithMax <- parALGO(distanceName="maximum")
kml(myCld,,3,toPlot="both",parAlgo=parWithMax)
## End(No test)



