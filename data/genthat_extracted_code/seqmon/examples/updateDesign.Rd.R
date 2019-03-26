library(seqmon)


### Name: updateDesign
### Title: Function that updates the design
### Aliases: updateDesign

### ** Examples

design1<-sequential.design()
design1<-setTimes(design1,c(1,2))
design1<-calcBoundaries(design1)
design1<-setCurrentLook(design1,1)
design2<-updateDesign(design1,c(3))




