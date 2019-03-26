context("tsvreq_classic")

test_that("test the values format",{
  set.seed(101)
  X<-matrix(runif(10*20)+1,10,20)
  h<-tsvreq_classic(X)
  
  #test class and names
  expect_s3_class(h,"tsvreq_classic")
  expect_s3_class(h,"tsvreq")
  expect_s3_class(h,"list")
  expect_equal(names(h),c("ts","com","comnull","tsvr","wts"))
})

test_that("test for consistency in various ways",{
  set.seed(101)
  X<-matrix(runif(10*20)+1,10,20)
  h<-tsvreq_classic(X)

  #test consistency
  expect_equal(h$com,h$comnull*h$tsvr)
  
  #test the CVcom2 - should sum to the value gotten by vreq_classic
  hsum<-vreq_classic(X)
  expect_equal(sum(h$com),hsum$com)
  
  #test CVcomip2 - should sum to the value gotten by vreq_classic
  expect_equal(sum(h$comnull),hsum$comnull)
  
  #test variance ratio quantities and their relationship to non-fs quantities
  expect_equal(sum(h$tsvr*h$wts),hsum$vr)

  #do it all again on another random set of numbers
  X<-matrix(runif(10*20)+1,10,20)
  h<-tsvreq_classic(X)
  
  #test consistency
  expect_equal(h$com,h$comnull*h$tsvr)
  
  #test the CVcom2 - should sum to the value gotten by vreq_classic
  hsum<-vreq_classic(X)
  expect_equal(sum(h$com),hsum$com)
  
  #test CVcomip2 - should sum to the value gotten by vreq_classic
  expect_equal(sum(h$comnull),hsum$comnull)
  
  #test variance ratio quantities and their relationship to non-fs quantities
  expect_equal(sum(h$tsvr*h$wts),hsum$vr)
})