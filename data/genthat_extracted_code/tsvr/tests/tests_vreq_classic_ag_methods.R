context("vreq_classic_ag")

test_that("test the set methods",{
  set.seed(101)
  X<-matrix(runif(10*100),10,100)
  h<-tsvreq_classic(X)
  h<-aggts(h,h$ts[h$ts>4])
  expect_error(set_com(h,3),"Error in set_com: vreq_classic_ag slots should not be changed individually")
  expect_error(set_comnull(h,2),"Error in set_comnull: vreq_classic_ag slots should not be changed individually")
  expect_error(set_vr(h,12),"Error in set_vr: vreq_classic_ag slots should not be changed individually")
  expect_error(set_ts(h,12),"Error in set_ts: vreq_classic_ag slots should not be changed individually")
})

test_that("test the get methods",{
  set.seed(102)
  X<-matrix(runif(10*100),10,100)
  h<-tsvreq_classic(X)
  h<-aggts(h,h$ts[h$ts>4])
  expect_equal(get_com(h),h$com)
  expect_equal(get_comnull(h),h$comnull)
  expect_equal(get_vr(h),h$vr)
  expect_equal(get_ts(h),h$ts)
})

test_that("test the summary method",{
  set.seed(103)
  X<-matrix(runif(10*100),10,100)
  h<-tsvreq_classic(X)
  h<-aggts(h,h$ts[h$ts>4])
  out<-summary(h)
  expect_equal(names(out),c("class","com","comnull","vr","ts_start","ts_end","ts_length"))
  expect_equal(out$class,"vreq_classic_ag")
  expect_equal(out$com,h$com)
  expect_equal(out$comnull,h$comnull)
  expect_equal(out$vr,h$vr)
  expect_equal(out$ts_start,h$ts[1])
  expect_equal(out$ts_end,h$ts[length(h$ts)])
  expect_equal(out$ts_length,length(h$ts))
})

test_that("test the print method",{
  set.seed(103)
  X<-matrix(runif(10*100),10,100)
  h<-tsvreq_classic(X)
  inp<-aggts(h,h$ts[h$ts>4])
  inp$com<-1
  inp$comnull<-2
  inp$vr<-3 
  inp$ts<-1:20 #not supposed to change entries of a vreq_classic_ag object, but ok for this test, and better
  #to use integer values for the test of print, so the test will work on multiple platforms
  expect_output(print(inp),"Object of class vreq_classic_ag:\n CVcom2: 1\n CVcomip2: 2\n vr: 3\n ts: 1 2 3 ... 18 19 20",fixed=TRUE)
})
