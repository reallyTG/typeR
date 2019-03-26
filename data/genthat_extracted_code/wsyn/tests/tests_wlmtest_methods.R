context("wlmtest_methods")

#tests of set and get functions considered unnecessary

test_that("test print.wlmtest",{
  set.seed(201)
  times<-1:30
  dat<-list(resp=matrix(rnorm(300),10,30),pred1=matrix(rnorm(300),10,30),pred2=matrix(rnorm(300),10,30),
            pred3=matrix(rnorm(300),10,30))
  dat<-lapply(FUN=function(x){cleandat(x,times,1)$cdat},X=dat)
  resp<-1
  pred<-2:4
  norm<-"powall"
  wlmobj<-wlm(dat,times,resp,pred,norm)
  drop<-3:4
  sigmethod<-"fft"
  res1<-wlmtest(wlmobj,drop,sigmethod,nrand=10)
  expect_equal(capture_output(print(res1)),"wlmtest object:\nwlmobj$times, a length 30 numeric vector:\n1 2 3 4 5 ... 26 27 28 29 30 \nNumber of sampling locations: 10 \nwlmobj$timescales, a length 37 numeric vector:\n2 2.1 2.205 2.31525 2.4310125 ... 9.52988293720722 10.0063770840676 10.506695938271 11.0320307351845 11.5836322719437 \nThe original wavelet regression: resp~pred1+pred2+pred3 \nThe indices in wlmobj$dat of predictors dropped: 3 4 \nwlmobj$norm, the normalization used: powall \nsigmethod, the type of significance testing used: fft \nNumber of surrogates: 10 \nwtopt: scale.min=2; scale.max.input=NULL; sigma=1.05; f0=1\nThe ranks slot is: empty\nTimescale bands tested in bandp slot: none")
  
  set.seed(201)
  times<-1:30
  dat<-list(resp=matrix(rnorm(300),10,30),pred1=matrix(rnorm(300),10,30),pred2=matrix(rnorm(300),10,30),
            pred3=matrix(rnorm(300),10,30))
  dat<-lapply(FUN=function(x){cleandat(x,times,1)$cdat},X=dat)
  resp<-1
  pred<-2:4
  norm<-"powall"
  wlmobj<-wlm(dat,times,resp,pred,norm)
  drop<-c("pred2","pred3")
  sigmethod<-"fft"
  res2<-wlmtest(wlmobj,drop,sigmethod,nrand=10)
  expect_equal(capture_output(print(res2)),"wlmtest object:\nwlmobj$times, a length 30 numeric vector:\n1 2 3 4 5 ... 26 27 28 29 30 \nNumber of sampling locations: 10 \nwlmobj$timescales, a length 37 numeric vector:\n2 2.1 2.205 2.31525 2.4310125 ... 9.52988293720722 10.0063770840676 10.506695938271 11.0320307351845 11.5836322719437 \nThe original wavelet regression: resp~pred1+pred2+pred3 \nThe names of predictors dropped: pred2 pred3 \nwlmobj$norm, the normalization used: powall \nsigmethod, the type of significance testing used: fft \nNumber of surrogates: 10 \nwtopt: scale.min=2; scale.max.input=NULL; sigma=1.05; f0=1\nThe ranks slot is: empty\nTimescale bands tested in bandp slot: none")
  
  res2<-bandtest(res2,c(3,5))
  res2<-bandtest(res2,c(8,12))
  expect_equal(capture_output(print(res2)),"wlmtest object:\nwlmobj$times, a length 30 numeric vector:\n1 2 3 4 5 ... 26 27 28 29 30 \nNumber of sampling locations: 10 \nwlmobj$timescales, a length 37 numeric vector:\n2 2.1 2.205 2.31525 2.4310125 ... 9.52988293720722 10.0063770840676 10.506695938271 11.0320307351845 11.5836322719437 \nThe original wavelet regression: resp~pred1+pred2+pred3 \nThe names of predictors dropped: pred2 pred3 \nwlmobj$norm, the normalization used: powall \nsigmethod, the type of significance testing used: fft \nNumber of surrogates: 10 \nwtopt: scale.min=2; scale.max.input=NULL; sigma=1.05; f0=1\nThe ranks slot is: filled\nTimescale bands tested in bandp slot:\n  ts_low_bd ts_hi_bd\n1         3        5\n2         8       12")
})

test_that("test summary.wlmtest and the print method for the summary_wsyn class",{
  set.seed(101)
  times<-1:30
  dat<-list(v1=matrix(rnorm(300),10,30),v2=matrix(rnorm(300),10,30),v3=matrix(rnorm(300),10,30),
            v4=matrix(rnorm(300),10,30),v5=matrix(rnorm(300),10,30))
  dat<-lapply(FUN=function(x){cleandat(x,times,1)$cdat},X=dat)
  resp<-1
  pred<-2:3
  norm<-"powall"
  wlmobj<-wlm(dat,times,resp,pred,norm)
  drop<-3
  sigmethod<-"fft"
  res<-wlmtest(wlmobj,drop,sigmethod,nrand=10)
  
  h<-summary(res)
  expect_equal(class(h),c("summary_wsyn","list"))
  expect_equal(names(h),c("class","times_start","times_end","times_increment",
                          "sampling_locs",
                          "timescale_start","timescale_end","timescale_length",
                          "orig_wavelet_regression","predictors_dropped",
                          "normalization","sigmethod","nsurrogs",
                          "scale.min","scale.max.input","sigma","f0",
                          "ranks_slot_is"))
  expect_equal(h[[1]],"wlmtest")
  expect_equal(h[[2]],1)
  expect_equal(h[[3]],30)
  expect_equal(h[[4]],1)
  expect_equal(h[[5]],10)
  expect_equal(h[[6]],2)
  expect_equal(h[[9]],"v1~v2+v3")
  expect_equal(h[[10]],"v3")
  expect_equal(h[[11]],"powall")
  expect_equal(h[[12]],"fft")
  expect_equal(h[[13]],10)
  expect_equal(h[[14]],2)
  expect_equal(h[[15]],"NULL")
  expect_equal(h[[16]],1.05)
  expect_equal(h[[17]],1)
  expect_equal(h[[18]],"empty")
  
  expect_equal(capture_output(print(h)),"class: wlmtest\ntimes_start: 1\ntimes_end: 30\ntimes_increment: 1\nsampling_locs: 10\ntimescale_start: 2\ntimescale_end: 11.58363\ntimescale_length: 37\norig_wavelet_regression: v1~v2+v3\npredictors_dropped: v3\nnormalization: powall\nsigmethod: fft\nnsurrogs: 10\nscale.min: 2\nscale.max.input: NULL\nsigma: 1.05\nf0: 1\nranks_slot_is: empty")
})  