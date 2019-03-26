library(seqmon)


### Name: print
### Title: Function that displays the features of the design
### Aliases: print

### ** Examples

design1<-sequential.design()
design1<-calcBoundaries(design1)
design1<-setAlphaspendfString(design1,"0.025*t^4")
design1<-setBetaspendfString(design1,"0.15*t^3")
print(design1)



