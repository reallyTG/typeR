context("wt_methods")

#tests of set and get functions considered unnecessary

test_that("test print.wt", {
  set.seed(101)
  
  times<-1:12
  t.series<-rnorm(length(times))
  t.series<-cleandat(t.series,times,1)$cdat
  obj1<-wt(t.series,times)
  
  times<-1:9
  t.series<-rnorm(length(times))
  t.series<-cleandat(t.series,times,1)$cdat
  obj2<-wt(t.series,times)
  
  times<-1:7
  t.series<-rnorm(length(times))
  t.series<-cleandat(t.series,times,1)$cdat
  obj3<-wt(t.series,times)
  
  expect_equal(capture_output(print(obj1)),"wt object:\ntimes, a length 12 numeric vector:\n1 2 3 4 5 ... 8 9 10 11 12 \ntimescales, a length 16 numeric vector:\n2 2.1 2.205 2.31525 2.4310125 ... 3.42067871623263 3.59171265204426 3.77129828464647 3.9598631988788 4.15785635882274 \nvalues, a 12 by 16 matrix, upper left to four digits is:\n           [,1]            [,2]            [,3]            [,4]            [,5]\n[1,]         NA              NA              NA              NA              NA\n[2,]         NA              NA              NA              NA              NA\n[3,]         NA              NA              NA              NA              NA\n[4,]  1.0230+0i  0.9999-0.1560i  0.9483-0.2947i  0.8710-0.3773i  0.7561-0.3846i\n[5,] -0.7072+0i -0.6912+0.2462i -0.6678+0.4657i -0.6359+0.5937i -0.5822+0.5952i\nwtopt: scale.min=2; scale.max.input=NULL; sigma=1.05; f0=1")

  expect_equal(capture_output(print(obj2)),"wt object:\ntimes, a length 9 numeric vector:\n1 2 3 4 5 6 7 8 9 \ntimescales, a length 11 numeric vector:\n2 2.1 2.205 2.31525 2.4310125 2.552563125 2.68019128125 2.8142008453125 2.95491088757813 3.10265643195703 3.25778925355488 \nvalues, a 9 by 11 matrix, upper left to four digits is:\n           [,1]            [,2]            [,3]            [,4]            [,5]\n[1,]         NA              NA              NA              NA              NA\n[2,]         NA              NA              NA              NA              NA\n[3,]         NA              NA              NA              NA              NA\n[4,] -0.4310+0i -0.4200+0.3874i -0.2501+0.7390i  0.0411+1.0375i  0.3853+1.2712i\n[5,] -0.0171+0i -0.0178-0.1361i -0.2143-0.2577i -0.5605-0.3350i -0.9703-0.3517i\nwtopt: scale.min=2; scale.max.input=NULL; sigma=1.05; f0=1")

  expect_equal(capture_output(print(obj3)),"wt object:\ntimes, a length 7 numeric vector:\n1 2 3 4 5 6 7 \ntimescales, a length 5 numeric vector:\n2 2.1 2.205 2.31525 2.4310125 \nvalues, a 7 by 5 matrix, upper left to four digits is:\n          [,1]           [,2]           [,3]           [,4]           [,5]\n[1,]        NA             NA             NA             NA             NA\n[2,]        NA             NA             NA             NA             NA\n[3,]        NA             NA             NA             NA             NA\n[4,] 2.2429+0i 2.1896+0.1794i 2.1306+0.3413i 2.0667+0.4632i 1.9931+0.5317i\n[5,]        NA             NA             NA             NA             NA\nwtopt: scale.min=2; scale.max.input=NULL; sigma=1.05; f0=1")
})

test_that("test summary.wt and the print method for the summary_wsyn class",{
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
  
  h<-summary(res)
  expect_equal(class(h),c("summary_wsyn","list"))
  expect_equal(names(h),c("class","times_start","times_end","times_increment",
                          "timescale_start","timescale_end","timescale_length",
                          "scale.min","scale.max.input","sigma","f0"))
  expect_equal(h[[1]],"wt")
  expect_equal(h[[2]],1)
  expect_equal(h[[3]],200)
  expect_equal(h[[4]],1)
  expect_equal(h[[5]],2)
  expect_equal(h[[8]],2)
  expect_equal(h[[9]],"NULL")
  expect_equal(h[[10]],1.05)
  expect_equal(h[[11]],1)
  
  expect_equal(capture_output(print(h)),"class: wt\ntimes_start: 1\ntimes_end: 200\ntimes_increment: 1\ntimescale_start: 2\ntimescale_end: 81.54864\ntimescale_length: 77\nscale.min: 2\nscale.max.input: NULL\nsigma: 1.05\nf0: 1")
})