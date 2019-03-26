library(lgtdl)


### Name: interpprev
### Title: Interpolation Using the Previous Value
### Aliases: interpprev interpprev.lgtdl interpprev.AsIs
### Keywords: smooth

### ** Examples

  x1<-data.frame(time=c(1,3,5), cov=c(4,6,8))
  x2<-data.frame(time=c(11,13,15), interest=c(66,45,88))
  x1<-as.lgtdl(x1)
  x2<-as.lgtdl(x2)
  interpprev(x1, c(2,4))
  interpprev(x2, c(12, 14))



