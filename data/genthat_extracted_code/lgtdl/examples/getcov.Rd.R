library(lgtdl)


### Name: getcov
### Title: A function to extract the covariate from an object of class
###   lgtdl.
### Aliases: getcov getcov.lgtdl
### Keywords: utilities

### ** Examples

  x1<-data.frame(time=c(1,3,5), cov=c(4,6,8))
  x2<-data.frame(time=c(11,13,15), interest=c(66,45,88))

  x1<-as.lgtdl(x1)
  x2<-as.lgtdl(x2)
  getcov(x1)
  getcov(x2)



