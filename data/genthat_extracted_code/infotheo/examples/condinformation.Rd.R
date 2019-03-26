library(infotheo)


### Name: condinformation
### Title: conditional mutual information computation
### Aliases: condinformation
### Keywords: misc

### ** Examples

  data(USArrests)
  dat<-discretize(USArrests)
  I <- condinformation(dat[,1],dat[,2],dat[,3],method="emp")



