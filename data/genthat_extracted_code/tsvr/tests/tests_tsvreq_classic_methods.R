context("tsvreq_classic_methods")

test_that("test the set methods",{
  set.seed(101)
  X<-matrix(runif(1000),10,100)
  h<-tsvreq_classic(X)
  expect_error(set_ts(h,3),"Error in set_ts: tsvreq_classic slots should not be changed individually")
  expect_error(set_com(h,3),"Error in set_com: tsvreq_classic slots should not be changed individually")
  expect_error(set_comnull(h,2),"Error in set_comnull: tsvreq_classic slots should not be changed individually")
  expect_error(set_tsvr(h,12),"Error in set_tsvr: tsvreq_classic slots should not be changed individually")
  expect_error(set_wts(h,12),"Error in set_wts: tsvreq_classic slots should not be changed individually")
})

test_that("test the get methods",{
  set.seed(102)
  X<-matrix(runif(1000),10,100)
  h<-tsvreq_classic(X)
  expect_equal(get_ts(h),h$ts)
  expect_equal(get_com(h),h$com)
  expect_equal(get_comnull(h),h$comnull)
  expect_equal(get_tsvr(h),h$tsvr)
  expect_equal(get_wts(h),h$wts)
})

test_that("test the summary method",{
  set.seed(101)
  X<-matrix(runif(10*20)+1,10,20)
  inp<-tsvreq_classic(X)
  out<-summary(inp)
  expect_s3_class(out,"summary_tsvr")
  expect_s3_class(out,"list")
  expect_equal(names(out),c("class","ts_start","ts_end","ts_length","com_length","comnull_length","tsvr_length","wts_length"))
  expect_equal(out$class,"tsvreq_classic")
  expect_equal(out$ts_start,inp$ts[1])
  expect_equal(out$ts_end,inp$ts[length(inp$ts)])
  expect_equal(out$ts_length,length(inp$ts))
  expect_equal(out$com_length,length(inp$ts))
  expect_equal(out$comnull_length,length(inp$ts))
  expect_equal(out$tsvr_length,length(inp$ts))
  expect_equal(out$wts_length,length(inp$ts))
})

test_that("test the print method",{
  set.seed(101)
  X<-matrix(runif(10*20)+1,10,20)
  inp<-tsvreq_classic(X)
  expect_known_output(print(inp),"../vals/print_tsvreq_classic_testval_01.txt",print=TRUE,update=FALSE)
})

test_that("test the plot method",{
  X<-matrix(runif(10*100),10,100)
  inp<-tsvreq_classic(X)
  
  Test_plot_tsvreq_classic<-function(){plot(inp)}  
  vdiffr::expect_doppelganger(title="Test-plot-tsvreq-classic",fig=Test_plot_tsvreq_classic)
})
