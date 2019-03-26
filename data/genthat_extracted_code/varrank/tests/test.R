###############################################################################
## test.R ---
## Author          : Gilles Kratzer
## Document created: 29/11/2017
## update            14/12/2017 MAJ output of varrank
###############################################################################

##Purpose: Test the varrank sofware

Sys.setenv("R_TESTS" = "")
library(datasets)
library(testthat)
library(entropy)
#library(abn)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##General tests
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

context("General tests")

test_that("Test discretization() entropy.data()",{

    out<-data.frame(a=rnorm(n = 1000,mean = 0,sd = 0.1), b=rnorm(n = 1000,mean = 1+rnorm(n = 1000,mean = 0,sd = 0.1),sd = 0.1), c = rnorm(n = 1000,mean = 1+rnorm(n = 1000,mean = 0,sd = 0.1),sd = 0.1))

    y2d.entropy.1<-entropy::discretize2d(x1 = out$a,x2 = out$b,numBins1 = 100,numBins2 = 100)
    y2d.abn.1<-table(varrank::discretization(data.df = out[,c(1,2)],discretization.method = 100))

    y2d.entropy.2<-entropy::discretize2d(x1 = out$a,x2 = out$c,numBins1 = 100,numBins2 = 100)
    y2d.abn.2<-table(varrank::discretization(data.df = out[,c(1,3)],discretization.method = 100))

    #Not the same dimnames!
    dimnames(y2d.abn.1)<-dimnames(y2d.entropy.1)
    dimnames(y2d.abn.2)<-dimnames(y2d.entropy.2)

    expect_equal(y2d.abn.1,y2d.entropy.1)
    expect_equal(y2d.abn.2,y2d.entropy.2)

    expect_equal(varrank::entropy.data(freqs.table = y2d.abn.1),entropy::entropy.empirical(y = y2d.entropy.1,unit = "log2"))
    expect_equal(varrank::entropy.data(freqs.table = y2d.abn.2),entropy::entropy.empirical(y = y2d.entropy.2,unit = "log2"))

})

test_that("Test mi.data()",{

  n<-10000
  s1 = 2
  s2 = 4
  u1 = 10
  u2 = 12
  r = 0.5
  covar = r*s1*s2
  Sigma = matrix(ncol=2,nrow=2,c(s1^2,covar,covar,s2^2))
  temp = eigen(Sigma)
  SqrtSigma = temp$vectors%*%diag(sqrt(temp$values))%*%t(temp$vectors)
  XYvec = c(u1,u2) + SqrtSigma%*%rnorm(2)
  XYvec

  X = rep(NA,n)
  Y = rep(NA,n)
  for(i in 1:n){
    XYvec = c(u1,u2) + SqrtSigma%*%rnorm(2)
    X[i] = XYvec[1]
    Y[i] = XYvec[2]
  }

  ##MI is symetric
  expect_that(varrank::mi.data(X = Y,Y = X,discretization.method = "sturges"), equals(varrank::mi.data(X = X,Y = Y,discretization.method = "sturges")))
  expect_that(varrank::mi.data(X = Y,Y = X,discretization.method = "fd"), equals(varrank::mi.data(X = X,Y = Y,discretization.method = "fd")))

  ##MI is more or less well estimated
  expect_equal(varrank::mi.data(X = Y,Y = X,discretization.method = "sturges"),-1/2*log2(x = 1-0.5^2),tolerance=0.05)

  })
test_that("Test varrank()",{

  ##output format: forward:

  expect_equal(length(varrank(data.df = longley, method = "estevez",variable.important = "Employed",discretization.method = "sturges",algorithm = "forward",scheme = "mid",verbose=FALSE)$ordered.var),6)

  expect_equal(length(varrank(data.df = longley, method = "estevez",variable.important = "Employed",discretization.method = "fd",algorithm = "forward",n.var = 3,scheme = "mid",verbose=FALSE)$ordered.var),3)

  expect_equal(length(varrank(data.df = longley, method = "estevez",variable.important = "Employed",discretization.method = "cencov",algorithm = "forward",scheme = "mid",n.var = 2,verbose=FALSE)$ordered.var),2)

  expect_equal(length(varrank(data.df = longley, method = "estevez",variable.important = "Employed",discretization.method = "cencov",algorithm = "forward",scheme = "mid",n.var = 1,verbose=FALSE)$ordered.var),1)

  expect_equal(length(varrank(data.df = longley, method = "peng",variable.important = c("Employed","Year"),discretization.method = "cencov",algorithm = "forward",scheme = "mid",n.var = 1,verbose=FALSE)$ordered.var),1)

  expect_equal(length(varrank(data.df = longley, method = "estevez",variable.important = c("Employed","Year"),discretization.method = "cencov",algorithm = "forward",scheme = "mid",n.var = NULL,verbose=FALSE)$ordered.var),5)

  expect_equal(dim(varrank(data.df = longley, method = "estevez",variable.important = c("Employed","Year"),discretization.method = "cencov",algorithm = "forward",scheme = "mid",n.var = NULL,verbose=FALSE)$distance.m),c(5,5))

  expect_equal(dim(varrank(data.df = longley, method = "estevez",variable.important = c("Employed","Year"),discretization.method = "cencov",algorithm = "forward",scheme = "mid",n.var = 2,verbose=FALSE)$distance.m),c(5,2))

  out<-varrank(data.df = longley, method = "estevez",variable.important = c("Employed","Year"),discretization.method = "cencov",algorithm = "forward",scheme = "mid",n.var = NULL,verbose=FALSE)

  expect_equal(out$ordered.var,colnames(out$distance.m))

  expect_equal(out$ordered.var,rownames(out$distance.m))

  ##output format: backward

  expect_equal(length(varrank(data.df = longley, method = "peng",variable.important = "Employed",discretization.method = "cencov",algorithm = "backward",scheme = "mid",verbose=FALSE,n.var = 3)$ordered.var),3)

  expect_equal(length(varrank(data.df = longley, method = "peng",variable.important = "Employed",discretization.method = "cencov",algorithm = "backward",scheme = "miq",verbose=FALSE,n.var = 3)$ordered.var),3)
})

test_that("Test S3 method",{

  ##summary
  out<-varrank(data.df = longley, method = "peng",variable.important = "Employed",discretization.method = "cencov",algorithm = "forward",scheme = "mid",verbose=FALSE,n.var = 3)
  expect_error(summary(out),NA)

  out<-varrank(data.df = longley, method = "peng",variable.important = "Employed",discretization.method = "cencov",algorithm = "backward",scheme = "mid",verbose=FALSE,n.var = 5)
  expect_error(summary(out),NA)

})

