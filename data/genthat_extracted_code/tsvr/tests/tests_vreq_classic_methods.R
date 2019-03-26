context("vreq_classic_methods")

test_that("test the set methods",{
  set.seed(101)
  X<-matrix(runif(10*100),10,100)
  h<-vreq_classic(X)
  expect_error(set_com(h,3),"Error in set_com: vreq_classic slots should not be changed individually")
  expect_error(set_comnull(h,2),"Error in set_comnull: vreq_classic slots should not be changed individually")
  expect_error(set_vr(h,12),"Error in set_vr: vreq_classic slots should not be changed individually")
})

test_that("test the get methods",{
  set.seed(101)
  X<-matrix(runif(10*100),10,100)
  h<-vreq_classic(X)
  expect_equal(get_com(h),h$com)
  expect_equal(get_comnull(h),h$comnull)
  expect_equal(get_vr(h),h$vr)
})

test_that("test the summary method",{
  set.seed(101)
  X<-matrix(runif(10*20)+1,10,20)
  inp<-vreq_classic(X)
  out<-summary(inp)
  expect_equal(names(out),c("class","com","comnull","vr"))
  expect_equal(out$class,"vreq_classic")
  expect_equal(out$com,inp$com)
  expect_equal(out$comnull,inp$comnull)
  expect_equal(out$vr,inp$vr)
})

test_that("test the print method",{
  set.seed(101)
  X<-matrix(1:200,10,20)
  inp<-vreq_classic(X)
  inp$com<-1
  inp$comnull<-2
  inp$vr<-3 #not supposed to change entries of a vreq_classic object, but ok for this test, and better
  #to use integer values for the test of print, so the test will work on multiple platforms
  expect_output(print(inp),"Object of class vreq_classic:\n CVcom2: 1\n CVcomip2: 2\n classic vr: 3",fixed=TRUE)
})

