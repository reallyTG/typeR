library(infotheo)


### Name: condentropy
### Title: conditional entropy computation
### Aliases: condentropy
### Keywords: misc

### ** Examples

  data(USArrests)
  dat<-discretize(USArrests)
  H <- condentropy(dat[,1], dat[,2], method = "mm")



