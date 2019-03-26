library(fpc)


### Name: fixmahal
### Title: Mahalanobis Fixed Point Clusters
### Aliases: fixmahal summary.mfpc plot.mfpc fpclusters.mfpc
###   print.summary.mfpc print.mfpc fpmi
### Keywords: cluster multivariate robust

### ** Examples

  options(digits=2)
  set.seed(20000)
  face <- rFace(400,dMoNo=2,dNoEy=0, p=3)
  # The first example uses grouping information via init.group.
  initg <- list()
  grface <- as.integer(attr(face,"grouping"))
  for (i in 1:5) initg[[i]] <- (grface==i)
  ff0 <- fixmahal(face, pointit=FALSE, init.group=initg)
  summary(ff0)
  cff0 <- fpclusters(ff0)
  plot(face, col=1+cff0[[1]])
  plot(face, col=1+cff0[[4]]) # Why does this come out as a cluster? 
  plot(ff0, face, 4) # A bit clearer...
  # Without grouping information, examples need more time:
  # ff1 <- fixmahal(face)
  # summary(ff1)
  # cff1 <- fpclusters(ff1)
  # plot(face, col=1+cff1[[1]])
  # plot(face, col=1+cff1[[6]]) # Why does this come out as a cluster? 
  # plot(ff1, face, 6) # A bit clearer...
  # ff2 <- fixmahal(face,method="ml")
  # summary(ff2)
  # ff3 <- fixmahal(face,method="ml",calpha=0.95,subset=50)
  # summary(ff3)
  ## ...fast, but lots of clusters. mer=0.3 may be useful here.
  # set.seed(3000)
  # face2 <- rFace(400,dMoNo=2,dNoEy=0)
  # ff5 <- fixmahal(face2)
  # summary(ff5)
  ## misses right eye of face data; with p=6,
  ## initial configurations are too large for 40 point clusters 
  # ff6 <- fixmahal(face2, startn=30)
  # summary(ff6)
  # cff6 <- fpclusters(ff6)
  # plot(face2, col=1+cff6[[3]])
  # plot(ff6, face2, 3)
  # x <- c(1,2,3,6,6,7,8,120)
  # ff8 <- fixmahal(x)
  # summary(ff8)
  # ...dataset a bit too small for the defaults...
  # ff9 <- fixmahal(x, mnc=3, startn=3)
  # summary(ff9)



