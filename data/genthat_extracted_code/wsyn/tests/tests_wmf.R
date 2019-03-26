context("wmf")

test_that("test for correct class of output, and for correct including of data and times",{
  times<-1:100
  dat<-matrix(rnorm(1000),10,100)
  for (counter in 1:10)
  {
    dat[counter,]<-dat[counter,]-mean(dat[counter,])
  }
  res<-wmf(dat,times)
  expect_s3_class(res,"wmf")
  expect_s3_class(res,"tts")
  expect_s3_class(res,"list")
  expect_equal(get_times(res),times)
  expect_equal(get_dat(res),dat)
})

test_that("other tests that output has the correct format",{
  times<-1:100
  dat<-matrix(rnorm(1000),10,100)
  for (counter in 1:10)
  {
    dat[counter,]<-dat[counter,]-mean(dat[counter,])
  }
  res<-wmf(dat,times)
  expect_equal(dim(get_values(res)),c(length(times),length(get_timescales(res))))
  expect_equal(class(get_values(res)[50,50]),"complex")
})

test_that("test for qualitatively correct output",{
  #this test based on supplementary figure 1 in Sheppard et al, Nature Climate Change, 
  #2016, doi: 10.1038/NCLIMATE2881
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
  #Make a plot to check visually. Expected to look like panel panel k of supp fig 1 in the 
  #reference cited above
  #image(get_times(res),log2(get_timescales(res)),Mod(get_values(res)))
  #lines(c(1,100),log2(c(10,10)))
  #lines(c(1,100),log2(c(5,5)))
  #It looked good so I commented it out, now just check future runs are always the same.
  h<-Mod(res$values[25:75,10:30])
  expect_known_value(h,file="../vals/wmf_testval_01",update=FALSE)
})

