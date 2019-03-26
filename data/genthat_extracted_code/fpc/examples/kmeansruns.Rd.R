library(fpc)


### Name: kmeansruns
### Title: k-means with estimating k and initialisations
### Aliases: kmeansruns
### Keywords: cluster multivariate

### ** Examples

  options(digits=3)
  set.seed(20000)
  face <- rFace(50,dMoNo=2,dNoEy=0,p=2)
  pka <- kmeansruns(face,krange=1:5,critout=TRUE,runs=2,criterion="asw")
  pkc <- kmeansruns(face,krange=1:5,critout=TRUE,runs=2,criterion="ch")



