library(seqmon)


### Name: setNoncentrality
### Title: Function that sets the noncentrality parameter
### Aliases: setNoncentrality

### ** Examples

design1<-sequential.design()
noncent<-qnorm(0.975,0,1)+qnorm(0.8,0,1)
design1<-setNoncentrality(design1,noncent)



