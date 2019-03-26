library(fpc)


### Name: mahalconf
### Title: Mahalanobis fixed point clusters initial configuration
### Aliases: mahalconf
### Keywords: multivariate cluster

### ** Examples

  set.seed(4634)
  face <- rFace(600,dMoNo=2,dNoEy=0,p=2)
  mahalconf(face,no=200,startn=20,covall=cov(face),plot="start")



