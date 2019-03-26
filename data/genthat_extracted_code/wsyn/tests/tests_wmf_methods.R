context("wmf_methods")

#tests of set and get functions considered unnecessary

test_that("test print.wmf", {
  set.seed(101)
  
  times<-1:35
  dat<-matrix(rnorm(10*length(times)),10,length(times))
  dat<-cleandat(dat,times,1)$cdat
  obj1<-wmf(dat,times)
  
  expect_equal(capture_output(print(obj1)),"wmf object:\ntimes, a length 35 numeric vector:\n1 2 3 4 5 ... 31 32 33 34 35 \nNumber of sampling locations: 10 \ntimescales, a length 41 numeric vector:\n2 2.1 2.205 2.31525 2.4310125 ... 11.5836322719437 12.1628138855409 12.770954579818 13.4095023088089 14.0799774242493 \nvalues, a 35 by 41 matrix, upper left to four digits is:\n             [,1]            [,2]            [,3]            [,4]\n[1,]     NaN+NaNi     NaN+   NaNi     NaN+   NaNi     NaN+   NaNi\n[2,]     NaN+NaNi     NaN+   NaNi     NaN+   NaNi     NaN+   NaNi\n[3,]     NaN+NaNi     NaN+   NaNi     NaN+   NaNi     NaN+   NaNi\n[4,]  0.0779+  0i  0.0763+0.1036i  0.0944+0.1990i  0.1269+0.2798i\n[5,] -0.2036+  0i -0.1994-0.0426i -0.2280-0.0817i -0.2801-0.1123i\n                [,5]\n[1,]     NaN+   NaNi\n[2,]     NaN+   NaNi\n[3,]     NaN+   NaNi\n[4,]  0.1621+0.3384i\n[5,] -0.3357-0.1299i\nwtopt: scale.min=2; scale.max.input=NULL; sigma=1.05; f0=1")
})

test_that("test summary.wmf and the print method for the summary_wsyn class",{
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
  res<-wmf(dat,times)

  h<-summary(res)
  expect_equal(class(h),c("summary_wsyn","list"))
  expect_equal(names(h),c("class","times_start","times_end","times_increment",
                          "sampling_locs",
                          "timescale_start","timescale_end","timescale_length",
                          "scale.min","scale.max.input","sigma","f0"))
  expect_equal(h[[1]],"wmf")
  expect_equal(h[[2]],0)
  expect_equal(h[[3]],100)
  expect_equal(h[[4]],1)
  expect_equal(h[[5]],11)
  expect_equal(h[[6]],2)
  expect_equal(h[[9]],2)
  expect_equal(h[[10]],"NULL")
  expect_equal(h[[11]],1.05)
  expect_equal(h[[12]],1)
  
  expect_equal(capture_output(print(h)),"class: wmf\ntimes_start: 0\ntimes_end: 100\ntimes_increment: 1\nsampling_locs: 11\ntimescale_start: 2\ntimescale_end: 41.1876\ntimescale_length: 63\nscale.min: 2\nscale.max.input: NULL\nsigma: 1.05\nf0: 1")
})
