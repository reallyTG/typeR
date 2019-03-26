library(fpc)


### Name: pamk
### Title: Partitioning around medoids with estimation of number of
###   clusters
### Aliases: pamk
### Keywords: cluster multivariate

### ** Examples

  options(digits=3)
  set.seed(20000)
  face <- rFace(50,dMoNo=2,dNoEy=0,p=2)
  pk1 <- pamk(face,krange=1:5,criterion="asw",critout=TRUE)
  pk2 <- pamk(face,krange=1:5,criterion="multiasw",ns=2,critout=TRUE)
# "multiasw" is better for larger data sets, use larger ns then.
  pk3 <- pamk(face,krange=1:5,criterion="ch",critout=TRUE)



