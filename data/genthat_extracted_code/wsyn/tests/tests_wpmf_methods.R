context("wpmf_methods")

#tests of set and get functions considered unnecessary

test_that("test print.wpmf", {
  set.seed(101)
  
  times<-1:35
  dat<-matrix(rnorm(10*length(times)),10,length(times))
  dat<-cleandat(dat,times,1)$cdat
  obj1<-wpmf(dat,times)
  obj2<-wpmf(dat,times,sigmethod="quick")
  
  #expect_equal(capture_output(print(obj1)),"wpmf object:\ntimes, a length 35 numeric vector:\n1 2 3 4 5 ... 31 32 33 34 35 \nNumber of sampling locations: 10 \ntimescales, a length 41 numeric vector:\n2 2.1 2.205 2.31525 2.4310125 ... 11.5836322719437 12.1628138855409 12.770954579818 13.4095023088089 14.0799774242493 \nvalues, a 35 by 41 matrix, upper left is:\n                     [,1]                  [,2]                  [,3]\n[1,]    NaN+         NaNi        NaN+      NaNi        NaN+      NaNi\n[2,]    NaN+         NaNi        NaN+      NaNi        NaN+      NaNi\n[3,]    NaN+         NaNi        NaN+      NaNi        NaN+      NaNi\n[4,] -2e-01-0.000000e+00i -0.1305735+0.1425041i -0.0706824+0.1846758i\n[5,]  0e+00-1.235979e-14i -0.0346267-0.1169267i -0.0870901-0.1309446i\n                      [,4]                  [,5]\n[1,]        NaN+      NaNi        NaN+      NaNi\n[2,]        NaN+      NaNi        NaN+      NaNi\n[3,]        NaN+      NaNi        NaN+      NaNi\n[4,] -0.0066375+0.1951799i  0.0573871+0.2062358i\n[5,] -0.1257587-0.1167023i -0.1598855-0.1040173i\nwtopt: scale.min=2; scale.max.input=NULL; sigma=1.05; f0=1\nsignificance testing: NA")
  expect_known_output(obj1,"../vals/print_wpmf_testval_01.txt",print=TRUE,update=FALSE)
  
  #expect_equal(capture_output(print(obj2)),"wpmf object:\ntimes, a length 35 numeric vector:\n1 2 3 4 5 ... 31 32 33 34 35 \nNumber of sampling locations: 10 \ntimescales, a length 41 numeric vector:\n2 2.1 2.205 2.31525 2.4310125 ... 11.5836322719437 12.1628138855409 12.770954579818 13.4095023088089 14.0799774242493 \nvalues, a 35 by 41 matrix, upper left is:\n                     [,1]                  [,2]                  [,3]\n[1,]    NaN+         NaNi        NaN+      NaNi        NaN+      NaNi\n[2,]    NaN+         NaNi        NaN+      NaNi        NaN+      NaNi\n[3,]    NaN+         NaNi        NaN+      NaNi        NaN+      NaNi\n[4,] -2e-01-0.000000e+00i -0.1305735+0.1425041i -0.0706824+0.1846758i\n[5,]  0e+00-1.235979e-14i -0.0346267-0.1169267i -0.0870901-0.1309446i\n                      [,4]                  [,5]\n[1,]        NaN+      NaNi        NaN+      NaNi\n[2,]        NaN+      NaNi        NaN+      NaNi\n[3,]        NaN+      NaNi        NaN+      NaNi\n[4,] -0.0066375+0.1951799i  0.0573871+0.2062358i\n[5,] -0.1257587-0.1167023i -0.1598855-0.1040173i\nwtopt: scale.min=2; scale.max.input=NULL; sigma=1.05; f0=1\nsignificance testing: quick")
  expect_known_output(obj2,"../vals/print_wpmf_testval_02.txt",print=TRUE,update=FALSE)
})

test_that("test summary.wpmf and the print method for the summary_wsyn class",{
  set.seed(101)
  x1<-0:50
  x2<-51:100
  x<-c(x1,x2)
  ts1<-c(sin(2*pi*x1/10),sin(2*pi*x2/5))+1.1
  dat<-matrix(NA,11,length(x))
  for (counter in 1:dim(dat)[1])
  {
    ts2<-3*sin(2*pi*x/3+2*pi*runif(1))+3.1
    ts3<-rnorm(length(x),0,1.5)
    dat[counter,]<-ts1+ts2+ts3    
    dat[counter,]<-dat[counter,]-mean(dat[counter,])
  }
  times<-x
  res<-wpmf(dat,times)
  
  h<-summary(res)
  expect_equal(class(h),c("summary_wsyn","list"))
  expect_equal(names(h),c("class","times_start","times_end","times_increment",
                          "sampling_locs",
                          "timescale_start","timescale_end","timescale_length",
                          "scale.min","scale.max.input","sigma","f0",
                          "signif_testing"))
  expect_equal(h[[1]],"wpmf")
  expect_equal(h[[2]],0)
  expect_equal(h[[3]],100)
  expect_equal(h[[4]],1)
  expect_equal(h[[5]],11)
  expect_equal(h[[6]],2)
  expect_equal(h[[9]],2)
  expect_equal(h[[10]],"NULL")
  expect_equal(h[[11]],1.05)
  expect_equal(h[[12]],1)
  expect_equal(h[[13]],NA)
  
  expect_equal(capture_output(print(h)),"class: wpmf\ntimes_start: 0\ntimes_end: 100\ntimes_increment: 1\nsampling_locs: 11\ntimescale_start: 2\ntimescale_end: 41.1876\ntimescale_length: 63\nscale.min: 2\nscale.max.input: NULL\nsigma: 1.05\nf0: 1\nsignif_testing: NA")

  res<-wpmf(dat,times,sigmethod="quick")
  
  h<-summary(res)
  expect_equal(class(h),c("summary_wsyn","list"))
  expect_equal(names(h),c("class","times_start","times_end","times_increment",
                          "sampling_locs",
                          "timescale_start","timescale_end","timescale_length",
                          "scale.min","scale.max.input","sigma","f0",
                          "signif_testing"))
  expect_equal(h[[1]],"wpmf")
  expect_equal(h[[2]],0)
  expect_equal(h[[3]],100)
  expect_equal(h[[4]],1)
  expect_equal(h[[5]],11)
  expect_equal(h[[6]],2)
  expect_equal(h[[9]],2)
  expect_equal(h[[10]],"NULL")
  expect_equal(h[[11]],1.05)
  expect_equal(h[[12]],1)
  expect_equal(h[[13]],"quick")
  
  expect_equal(capture_output(print(h)),"class: wpmf\ntimes_start: 0\ntimes_end: 100\ntimes_increment: 1\nsampling_locs: 11\ntimescale_start: 2\ntimescale_end: 41.1876\ntimescale_length: 63\nscale.min: 2\nscale.max.input: NULL\nsigma: 1.05\nf0: 1\nsignif_testing: quick")
})