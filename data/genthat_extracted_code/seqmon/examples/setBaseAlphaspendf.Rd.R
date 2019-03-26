library(seqmon)


### Name: setBaseAlphaspendf
### Title: Function that sets the base alpha spending function
### Aliases: setBaseAlphaspendf

### ** Examples

design1<-sequential.design()
f1<-function (t) 0.025*t^3.5
design1<-setBaseAlphaspendf(design1,f1)



