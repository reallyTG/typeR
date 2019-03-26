library(fpc)


### Name: flexmixedruns
### Title: Fitting mixed Gaussian/multinomial mixtures with flexmix
### Aliases: flexmixedruns
### Keywords: cluster

### ** Examples

  options(digits=3)
  set.seed(776655)
  v1 <- rnorm(100)
  v2 <- rnorm(100)
  d1 <- sample(1:5,100,replace=TRUE)
  d2 <- sample(1:4,100,replace=TRUE)
  ldata <- cbind(v1,v2,d1,d2)
  fr <- flexmixedruns(ldata,
    continuous=2,discrete=2,simruns=2,n.cluster=2:3,allout=FALSE)
  print(fr$optimalk)
  print(fr$optsummary)
  print(fr$flexout@cluster)
  print(fr$flexout@components)



