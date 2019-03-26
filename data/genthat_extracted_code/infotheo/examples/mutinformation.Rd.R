library(infotheo)


### Name: mutinformation
### Title: mutual information computation
### Aliases: mutinformation
### Keywords: misc

### ** Examples

  data(USArrests)
  dat<-discretize(USArrests)
  #computes the MIM (mutual information matrix)
  I <- mutinformation(dat,method= "emp")
  I2<- mutinformation(dat[,1],dat[,2])



