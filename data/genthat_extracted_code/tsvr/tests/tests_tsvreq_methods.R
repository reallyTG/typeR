context("tsvreq_methods")

test_that("test the set methods",{
  h<-list(com=2,comnull=1,vr=2)
  expect_error(set_ts(h,3),"Error in set_ts: set_ts not defined for this class")
  expect_error(set_tsvr(h,12),"Error in set_tsvr: set_tsvr not defined for this class")
  expect_error(set_wts(h,3),"Error in set_wts: set_wts not defined for this class")
  h<-tsvreq(ts=c(1,2,3),com=c(2,2,2),comnull=c(2,1,2),tsvr=c(1,2,1),wts=c(1,1,1))
  expect_error(set_ts(h,3),"Error in set_ts: tsvreq slots should not be changed individually")
  expect_error(set_com(h,3),"Error in set_com: tsvreq slots should not be changed individually")
  expect_error(set_comnull(h,2),"Error in set_comnull: tsvreq slots should not be changed individually")
  expect_error(set_tsvr(h,12),"Error in set_tsvr: tsvreq slots should not be changed individually")
  expect_error(set_wts(h,12),"Error in set_wts: tsvreq slots should not be changed individually")
})

test_that("test the get methods",{
  h<-list(com=2,comnull=1,vr=2)
  expect_error(get_ts(h),"Error in get_ts: get_ts not defined for this class")
  expect_error(get_tsvr(h),"Error in get_tsvr: get_tsvr not defined for this class")
  expect_error(get_wts(h),"Error in get_wts: get_wts not defined for this class")
  h<-tsvreq(ts=c(1,2,3),com=c(2,2,2),comnull=c(2,1,2),tsvr=c(1,2,1),wts=c(1,1,1))
  expect_equal(get_ts(h),c(1,2,3))
  expect_equal(get_com(h),c(2,2,2))
  expect_equal(get_comnull(h),c(2,1,2))
  expect_equal(get_tsvr(h),c(1,2,1))
  expect_equal(get_wts(h),c(1,1,1))
})

test_that("test the summary method",{
  inp<-tsvreq(ts=c(1,2,3),com=c(2,2,2),comnull=c(2,1,2),tsvr=c(1,2,1),wts=c(1,1,1))
  out<-summary(inp)
  expect_equal(names(out),c("class","ts_start","ts_end","ts_length","com_length","comnull_length","tsvr_length","wts_length"))
  expect_equal(out$class,"tsvreq")
  expect_equal(out$ts_start,1)
  expect_equal(out$ts_end,3)
  expect_equal(out$ts_length,3)
  expect_equal(out$com_length,3)
  expect_equal(out$comnull_length,3)
  expect_equal(out$tsvr_length,3)
  expect_equal(out$wts_length,3)
})

test_that("test the print method",{
  inp<-tsvreq(ts=1:10,com=rep(2,10),comnull=rep(3,10),tsvr=rep(2/3,10),wts=rep(5,10))
  expect_known_output(inp,"../vals/print_tsvreq_testval_01.txt",print=TRUE,update=FALSE)
})

test_that("test the plot method",{
  inp<-tsvreq(ts=1:10,com=c(10:1)*rep(2,10),comnull=rep(2,10),tsvr=10:1,wts=2*c(1:10))
  
  Test_plot_tsvreq<-function(){plot(inp)}  
  vdiffr::expect_doppelganger(title="Test-plot-tsvreq",fig=Test_plot_tsvreq)
})

