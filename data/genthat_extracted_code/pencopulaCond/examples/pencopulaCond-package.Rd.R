library(pencopulaCond)


### Name: pencopulaCond-package
### Title: Estimating Non-Simplified Vine Copulas Using Penalized Splines
### Aliases: pencopulaCond-package
### Keywords: nonparametric

### ** Examples

  #Simulating from a three-dimensional frank copula with
  #kendell's tau equal to 0.25, sample size N.set=100.
  #Please enlarge N.set for further studies.
  #require(copula)
  #N.set<-100
  #cop <- archmCopula(family = "frank", dim = 3, param =2.39)
  #parMarg<-list(list(min=0,max=1),list(min=0,max=1),list(min=0,max=1))
  #distr.cop <- mvdc(cop, margins=rep("unif",3), paramMargins = parMarg,marginsIdentical=TRUE)
  #c.X <- rMvdc(mvdc=distr.cop, n=N.set)
  #Y <- punif(c.X)
  #vine.copula<-vine(Y,d=2,d2=2,D=4,D3=4,q=1,m=2,cores=1,lambda=c(10000,100))



