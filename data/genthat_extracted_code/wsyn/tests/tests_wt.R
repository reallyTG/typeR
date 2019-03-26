context("wt")

test_that("test for correct class of output, and for correct including of data and times",{
  times<-1:100
  t.series<-rnorm(length(times))
  t.series<-t.series-mean(t.series)
  res<-wt(t.series, times)
  expect_s3_class(res,"wt")
  expect_s3_class(res,"tts")
  expect_s3_class(res,"list")
  expect_equal(res$times,times)
  expect_equal(res$dat,t.series)
})

test_that("other tests that output has the correct format",{
  times<-1:100
  t.series<-rnorm(length(times))
  t.series<-t.series-mean(t.series)
  res<-wt(t.series, times)
  expect_equal(dim(res$values)[1],length(times))
  expect_equal(dim(res$values)[2],length(res$timescales))
  expect_equal(class(res$values[50,50]),"complex")
  expect_equal(res$timescales[1:10],2*1.05^(0:9))
})

test_that("test for qualitatively correct output, test 1",{
  #this test based on the first example in fig S2 of Sheppard et al, "Synchrony is more than its
  #top-down and climatic parts: interacting Moran effects on phytoplankton in British seas"
  set.seed(101)
  time1<-1:100
  time2<-101:200
  ts1p1<-sin(2*pi*time1/15)
  ts1p2<-0*time1
  ts2p1<-0*time2
  ts2p2<-sin(2*pi*time2/8)
  ts1<-ts1p1+ts1p2
  ts2<-ts2p1+ts2p2
  ts<-c(ts1,ts2)
  ra<-rnorm(200,mean=0,sd=0.5)
  t.series<-ts+ra
  t.series<-t.series-mean(t.series)
  times<-c(time1,time2)
  res<-wt(t.series, times)
  #Make a plot to check visually. Expected to have a brightly colored band at timescale
  #15 years for the first half of the time series, and then a band at 8 yrs for the second
  #half
  #image(res$times,res$timescales,Mod(res$values))
  #lines(c(1,200),c(15,15))
  #lines(c(1,200),c(8,8))
  #It looked good so I commented it out, now just check future runs are always the same.
  h<-Mod(res$values[75:125,]) #just test part, for file size reasons
  expect_known_value(h,file="../vals/wt_testval_01",update=FALSE)
})

test_that("test for qualitatively correct output, test 2",{
  #this test based on the second example in fig S2 of Sheppard et al, "Synchrony is more than its
  #top-down and climatic parts: interacting Moran effects on phytoplankton in British seas"
  set.seed(201)
  timeinc<-1 #one sample per year
  startfreq<-0.2 #cycles per year
  endfreq<-0.1 #cycles per year
  times<-1:200
  f<-seq(from=startfreq,by=(endfreq-startfreq)/(length(times)-1),to=endfreq) #frequency for each sample
  phaseinc<-2*pi*cumsum(f*timeinc)
  t.series<-sin(phaseinc)
  t.series<-t.series-mean(t.series)
  res<-wt(t.series, times)
  #Make a plot to check visually. Expected to have a brightly colored band at timescale
  #gradually changing from 5 to 10
  #image(res$times,res$timescales,Mod(res$values))
  #lines(c(1,200),c(5,5))
  #lines(c(1,200),c(10,10))
  #It looked good so I commented it out, now just check future runs are always the same.
  h<-Mod(res$values[75:125,]) #just test part, for file size reasons
  expect_known_value(h,file="../vals/wt_testval_02",update=FALSE)
})

test_that("test for non-default values of f0, sigma, scale.min, scale.max.input",{
  
  #do a test where you expand scale.max.input to a large values and compare with NULL
  #and find the same thing on the overlapping part
  times<-1:100
  t.series<-rnorm(length(times))
  t.series<-t.series-mean(t.series)
  res1<-wt(t.series, times)
  res2<-wt(t.series, times, scale.max.input = 1000)
  
  expect_equal(res1$times,res2$times)
  
  numnonnas1<-apply(FUN=sum,X=is.finite(res1$values),MARGIN=2)
  ts1<-res1$timescales[numnonnas1>0]
  numnonnas2<-apply(FUN=sum,X=is.finite(res2$values),MARGIN=2)
  ts2<-res2$timescales[numnonnas2>0]
  expect_equal(numnonnas1,numnonnas2[1:length(numnonnas1)])
  expect_equal(ts1,ts2)
  
  expect_equal(res1$values,res2$values[,numnonnas2>0])
  
  #do a test where you try a couple different values of f0
  set.seed(201)
  timeinc<-1 #one sample per year
  startfreq<-0.2 #cycles per year
  endfreq<-0.1 #cycles per year
  times<-1:200
  f<-seq(from=startfreq,by=(endfreq-startfreq)/(length(times)-1),to=endfreq) #frequency for each sample
  phaseinc<-2*pi*cumsum(f*timeinc)
  t.series<-sin(phaseinc)
  t.series<-t.series-mean(t.series)

  res0p5<-wt(t.series, times, f0=0.5)
  #plotmag(res0p5)
  #lines(range(res1$times),log2(c(5,5)),type='l')
  #lines(range(res1$times),log2(c(10,10)),type='l')

  res1<-wt(t.series, times)
  #plotmag(res1)
  #lines(range(res1$times),log2(c(5,5)),type='l')
  #lines(range(res1$times),log2(c(10,10)),type='l')
  
  res2<-wt(t.series, times, f0=2)
  #plotmag(res2)
  #lines(range(res1$times),log2(c(5,5)),type='l')
  #lines(range(res1$times),log2(c(10,10)),type='l')
  
  #checked plots looked right, now comment out the plot lines and use expect_known_value
  expect_known_value(Mod(res0p5$values[75:125,]),file="../vals/wt_testval_03",update=FALSE)
  expect_known_value(Mod(res1$values[75:125,]),file="../vals/wt_testval_04",update=FALSE)
  expect_known_value(Mod(res2$values[75:125,]),file="../vals/wt_testval_05",update=FALSE)

  #do a test where you try a different value of scale.min
  res1<-wt(t.series, times)
  res2<-wt(t.series, times, scale.min=2*1.05^5)
  expect_equal(res1$times,res2$times)
  expect_equal(res1$timescales[6:length(res1$timescales)],res2$timescales)
  expect_equal(res1$values[,6:length(res1$timescales)],res2$values)  
  
  #test non-default values of sigma
  res1<-wt(t.series, times, sigma=1.05, f0=3)
  res2<-wt(t.series, times, sigma=1.025, f0=3)
  expect_equal(res1$timescales[1:10],2*1.05^c(0:9))
  expect_equal(res2$timescales[1:10],2*1.025^c(0:9))

  #plotmag(res1)
  #plotmag(res2)
  #checked these look right, now comment out the plot lines and use expect_known_value
  expect_known_value(Mod(res1$values[75:125,]),file="../vals/wt_testval_06",update=FALSE)
  expect_known_value(Mod(res2$values[75:125,]),file="../vals/wt_testval_07",update=FALSE)
})

