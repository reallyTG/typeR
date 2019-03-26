library(fpc)


### Name: clucols
### Title: Sets of colours and symbols for cluster plotting
### Aliases: clucols clugrey clusym
### Keywords: cluster

### ** Examples

  set.seed(112233)
  require(MASS)
  require(flexmix)
  data(Cars93)
  Cars934 <- Cars93[,c(3,5,8,10)]
  cc <-
    discrete.recode(Cars934,xvarsorted=FALSE,continuous=c(2,3),discrete=c(1,4))
  fcc <- flexmix(cc$data~1,k=3,
  model=lcmixed(continuous=2,discrete=2,ppdim=c(6,3),diagonal=TRUE))
  plot(Cars934[,c(2,3)],col=clucols(3)[fcc@cluster],pch=clusym[fcc@cluster])



