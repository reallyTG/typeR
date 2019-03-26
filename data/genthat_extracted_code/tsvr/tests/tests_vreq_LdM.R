context("vreq_LdM")

test_that("test the values",{
  set.seed(101)
  X<-matrix(runif(10*20)+1,10,20)
  h<-vreq_LdM(X)
  
  #test class
  expect_s3_class(h,"vreq_LdM")
  expect_s3_class(h,"vreq")
  expect_s3_class(h,"list")
  
  #test consistency
  expect_equal(h$com,h$comnull*h$vr)
  
  #test the CVcom2
  Xtot<-colSums(X)
  expect_equal(var(Xtot)/((mean(Xtot))^2),h$com)
  
  #test CVpop2
  Xvars<-apply(FUN=var,X=X,MARGIN=1)
  expect_equal((sum(sqrt(Xvars)))^2/((mean(Xtot))^2),h$comnull)
  
  #test vr
  expect_equal(var(Xtot)/((sum(sqrt(Xvars)))^2),h$vr)
  
  #do it all again on another random set of numbers
  X<-matrix(runif(10*20)+1,10,20)
  h<-vreq_LdM(X)
  
  #test class
  expect_s3_class(h,"vreq_LdM")
  expect_s3_class(h,"vreq")
  expect_s3_class(h,"list")
  
  #test consistency
  expect_equal(h$com,h$comnull*h$vr)
  
  #test the CVcom2
  Xtot<-colSums(X)
  expect_equal(var(Xtot)/((mean(Xtot))^2),h$com)
  
  #test CVpop2
  Xvars<-apply(FUN=var,X=X,MARGIN=1)
  expect_equal((sum(sqrt(Xvars)))^2/((mean(Xtot))^2),h$comnull)
  
  #test vr
  expect_equal(var(Xtot)/((sum(sqrt(Xvars)))^2),h$vr)
})