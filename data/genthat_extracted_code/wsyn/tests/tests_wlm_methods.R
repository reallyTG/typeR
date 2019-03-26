context("wlm_methods")

#tests of set and get functions considered unnecessary

test_that("test print.wlm",{
  set.seed(201)
  times<-1:30
  dat<-list(resp=matrix(rnorm(300),10,30),pred1=matrix(rnorm(300),10,30),
            pred2=matrix(rnorm(300),10,30))
  dat<-lapply(FUN=function(x){cleandat(x,times,1)$cdat},X=dat)
  resp<-1
  pred<-2:3
  norm<-"powall"
  res<-wlm(dat,times,resp,pred,norm)
  
  expect_equal(capture_output(print(res)),"wlm object:\ntimes, a length 30 numeric vector:\n1 2 3 4 5 ... 26 27 28 29 30 \nNumber of sampling locations: 10 \ntimescales, a length 37 numeric vector:\n2 2.1 2.205 2.31525 2.4310125 ... 9.52988293720722 10.0063770840676 10.506695938271 11.0320307351845 11.5836322719437 \nThe wavelet regression: resp~pred1+pred2 \nnorm, the normalization used: powall \nwtopt: scale.min=2; scale.max.input=NULL; sigma=1.05; f0=1")  
})

test_that("test summary.wlm and the print method for the summary_wsyn class",{
  set.seed(101)
  times<-1:30
  dat<-list(v1=matrix(rnorm(300),10,30),v2=matrix(rnorm(300),10,30),v3=matrix(rnorm(300),10,30),
            v4=matrix(rnorm(300),10,30),v5=matrix(rnorm(300),10,30))
  dat<-lapply(FUN=function(x){cleandat(x,times,1)$cdat},X=dat)
  resp<-2
  pred<-c(1,3,4)
  norm<-"powall"
  res<-wlm(dat,times,resp,pred,norm)
  
  h<-summary(res)
  expect_equal(class(h),c("summary_wsyn","list"))
  expect_equal(names(h),c("class","times_start","times_end","times_increment",
                          "sampling_locs",
                          "timescale_start","timescale_end","timescale_length",
                          "wavelet_regression","normalization",
                          "scale.min","scale.max.input","sigma","f0"))
  expect_equal(h[[1]],"wlm")
  expect_equal(h[[2]],1)
  expect_equal(h[[3]],30)
  expect_equal(h[[4]],1)
  expect_equal(h[[5]],10)
  expect_equal(h[[6]],2)
  expect_equal(h[[9]],"v2~v1+v3+v4")
  expect_equal(h[[10]],"powall")
  expect_equal(h[[11]],2)
  expect_equal(h[[12]],"NULL")
  expect_equal(h[[13]],1.05)
  expect_equal(h[[14]],1)

  expect_equal(capture_output(print(h)),"class: wlm\ntimes_start: 1\ntimes_end: 30\ntimes_increment: 1\nsampling_locs: 10\ntimescale_start: 2\ntimescale_end: 11.58363\ntimescale_length: 37\nwavelet_regression: v2~v1+v3+v4\nnormalization: powall\nscale.min: 2\nscale.max.input: NULL\nsigma: 1.05\nf0: 1")
})  