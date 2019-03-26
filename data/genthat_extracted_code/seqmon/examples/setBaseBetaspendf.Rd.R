library(seqmon)


### Name: setBaseBetaspendf
### Title: Function that sets the base beta spending function
### Aliases: setBaseBetaspendf

### ** Examples

design1<-sequential.design()
f2<-function (t) 0.15*t^2.5
design1<-setBaseBetaspendf(design1,f2)



