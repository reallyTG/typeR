library(fpc)


### Name: clusterboot
### Title: Clusterwise cluster stability assessment by resampling
### Aliases: clusterboot print.clboot plot.clboot
### Keywords: cluster multivariate

### ** Examples

  options(digits=3)
  set.seed(20000)
  face <- rFace(50,dMoNo=2,dNoEy=0,p=2)
  cf1 <- clusterboot(face,B=3,bootmethod=
          c("boot","noise","jitter"),clustermethod=kmeansCBI,
          krange=5,seed=15555)
  print(cf1)
  plot(cf1)
  cf2 <- clusterboot(dist(face),B=3,bootmethod=
          "subset",clustermethod=disthclustCBI,
          k=5, cut="number", method="average", showplots=TRUE, seed=15555)
  print(cf2)
  d1 <- c("a","b","a","c")
  d2 <- c("a","a","a","b")
  dx <- as.data.frame(cbind(d1,d2))
  cpx <- clusterboot(dx,k=2,B=10,clustermethod=claraCBI,
          multipleboot=TRUE,usepam=TRUE,datatomatrix=FALSE)
  print(cpx)



