context("coh_methods")

#tests of set and get functions considered unnecessary

test_that("test print.coh",{
  set.seed(201)
  
  times<-1:35
  dat1<-matrix(rnorm(10*length(times)),10,length(times))
  dat1<-cleandat(dat1,times,1)$cdat
  dat2<-matrix(rnorm(10*length(times)),10,length(times))
  dat2<-cleandat(dat2,times,1)$cdat
  obj<-coh(dat1,dat2,times,"powall","fast")
  
  expect_equal(capture_output(print(obj)),"coh object:\ntimes, a length 35 numeric vector:\n1 2 3 4 5 ... 31 32 33 34 35 \nNumber of sampling locations: 10 \ntimescales, a length 41 numeric vector:\n2 2.1 2.205 2.31525 2.4310125 ... 11.5836322719437 12.1628138855409 12.770954579818 13.4095023088089 14.0799774242493 \nnorm, the normalization used: powall \nwtopt: scale.min=2; scale.max.input=NULL; sigma=1.05; f0=1\nsigmethod, the type of significance testing used: fast \nNumber of surrogates: 1000 \nThe ranks slot is: empty\nTimescale bands tested in bandp slot: none")
  
  obj<-bandtest(obj,c(3,5))
  obj<-bandtest(obj,c(8,12))
  
  expect_equal(capture_output(print(obj)),"coh object:\ntimes, a length 35 numeric vector:\n1 2 3 4 5 ... 31 32 33 34 35 \nNumber of sampling locations: 10 \ntimescales, a length 41 numeric vector:\n2 2.1 2.205 2.31525 2.4310125 ... 11.5836322719437 12.1628138855409 12.770954579818 13.4095023088089 14.0799774242493 \nnorm, the normalization used: powall \nwtopt: scale.min=2; scale.max.input=NULL; sigma=1.05; f0=1\nsigmethod, the type of significance testing used: fast \nNumber of surrogates: 1000 \nThe ranks slot is: filled\nTimescale bands tested in bandp slot:\n  ts_low_bd ts_hi_bd\n1         3        5\n2         8       12")
})

test_that("test summary.coh and the print method for the summary_wsyn class",{
  set.seed(101)
  times<-(-3:100)
  ts1<-sin(2*pi*times/10)
  ts2<-5*sin(2*pi*times/3)
  artsig_x<-matrix(NA,11,length(times)) #the driver
  for (counter in 1:11)
  {
    artsig_x[counter,]=ts1+ts2+rnorm(length(times),mean=0,sd=1.5)
  }
  times<-0:100
  artsig_y<-matrix(NA,11,length(times)) #the driven
  for (counter1 in 1:11)
  {
    for (counter2 in 1:101)
    {
      artsig_y[counter1,counter2]<-mean(artsig_x[counter1,counter2:(counter2+2)])
    }
  }
  artsig_y<-artsig_y+matrix(rnorm(length(times)*11,mean=0,sd=3),11,length(times))
  artsig_x<-artsig_x[,4:104]
  artsig_x<-cleandat(artsig_x,times,1)$cdat
  artsig_y<-cleandat(artsig_y,times,1)$cdat
  
  res<-coh(dat1=artsig_x,dat2=artsig_y,times=times,norm="powall",sigmethod="fast",nrand=1000,
           f0=0.5,scale.max.input=28)
  
  h<-summary(res)
  expect_equal(class(h),c("summary_wsyn","list"))
  expect_equal(names(h),c("class","times_start","times_end","times_increment",
                          "sampling_locs",
                          "timescale_start","timescale_end","timescale_length",
                          "normalization",
                          "scale.min","scale.max.input","sigma","f0",
                          "sigmethod","ranks_slot_is"))
  expect_equal(h[[1]],"coh")
  expect_equal(h[[2]],0)
  expect_equal(h[[3]],100)
  expect_equal(h[[4]],1)
  expect_equal(h[[5]],11)
  expect_equal(h[[6]],2)
  expect_equal(h[[9]],"powall")
  expect_equal(h[[10]],2)
  expect_equal(h[[11]],28)
  expect_equal(h[[12]],1.05)
  expect_equal(h[[13]],1/2)
  expect_equal(h[[14]],
               "fast")
  expect_equal(h[[15]],"empty")
  
  expect_equal(capture_output(print(h)),"class: coh\ntimes_start: 0\ntimes_end: 100\ntimes_increment: 1\nsampling_locs: 11\ntimescale_start: 2\ntimescale_end: 29.27126\ntimescale_length: 56\nnormalization: powall\nscale.min: 2\nscale.max.input: 28\nsigma: 1.05\nf0: 0.5\nsigmethod: fast\nranks_slot_is: empty")
})

