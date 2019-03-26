context("wpmf")

test_that("test for correct class of output, and for correct including of data and times",{
  times<-1:100
  dat<-matrix(rnorm(1000),10,100)
  for (counter in 1:10)
  {
    dat[counter,]<-dat[counter,]-mean(dat[counter,])
  }
  res<-wpmf(dat,times)
  expect_s3_class(res,"wpmf")
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
  res<-wpmf(dat,times)
  expect_equal(dim(get_values(res)),c(length(times),length(get_timescales(res))))
  expect_equal(class(get_values(res)[50,50]),"complex")
  
  rg<-range(Mod(get_values(res)),na.rm=T)
  expect_gte(rg[1],0)
  expect_lte(rg[2],1)
  
  expect_equal(is.na(res$signif),TRUE)
})

test_that("test for qualitatively correct output",{
  
  #***quick signif method
  
  #this test based on supplementary figure 1 in Sheppard et al, Nature Climate Change, 
  #2016, doi: 10.1038/NCLIMATE2881. We used the wmf there, but we could also have used
  #the wpmf
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
  res<-wpmf(dat,times,sigmethod="quick")
  rg<-range(Mod(get_values(res)),na.rm=T)
  expect_gte(rg[1],0)
  expect_lte(rg[2],1)
  expect_equal(res$signif[[1]],"quick")
  expect_equal(length(res$signif[[2]]),1000)
  #Make a plot to check visually. Expected to look like panel panel k of supp fig 1 in the 
  #reference cited above
  #image(get_times(res),log2(get_timescales(res)),Mod(get_values(res)))
  #lines(c(1,100),log2(c(10,10)))
  #lines(c(1,100),log2(c(5,5)))
  #par(new=T)
  #contour(get_times(res),log2(get_timescales(res)),Mod(get_values(res)),
  #        levels=unname(quantile(res$signif$magsumrndphas,.95)),axes=FALSE,drawlabels=FALSE,
  #        frame.plot=FALSE)
  #It looked good so I commented it out, now just check future runs are always the same.
  expect_known_value(list(Mod(res$values[25:75,20:40]),res$signif),file="../vals/wpmf_testval_01",update=FALSE)

  #***fft signif method

  if (exists(x="RUN_INTENSIVE_TESTS",envir=globalenv()) && 
      identical(globalenv()$RUN_INTENSIVE_TESTS,TRUE))
  {
    #this test based on supplementary figure 1 in Sheppard et al, Nature Climate Change,
    #2016, doi: 10.1038/NCLIMATE2881. We used the wmf there, but we could also have used
    #the wpmf. The only difference between this and the above is we are here using fft
    #significance testing
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
    res<-wpmf(dat,times,sigmethod="fft",nrand=50)
    expect_equal(res$signif[[1]],"fft")
    expect_equal(unname(res$signif[[2]]),50)
    expect_equal(class(res$signif$gt),"matrix")
    expect_equal(dim(get_values(res)),dim(res$signif$gt))
    
    #Make a plot to check visually. Expected to look like panel panel k of supp fig 1 in the
    #reference cited above
    #image(get_times(res),log2(get_timescales(res)),Mod(get_values(res)))
    #lines(c(1,100),log2(c(10,10)))
    #lines(c(1,100),log2(c(5,5)))
    #par(new=T)
    #contour(get_times(res),log2(get_timescales(res)),res$signif$gt,
    #        levels=.95,axes=FALSE,drawlabels=FALSE,
    #        frame.plot=FALSE)
    #It looked good so I commented it out, now just check future runs are always the same.
    expect_known_value(list(Mod(res$values[25:75,20:40]),res$signif),file="../vals/wpmf_testval_02",update=FALSE)
  }

  #***aaft signif method
  
  if (exists(x="RUN_INTENSIVE_TESTS",envir=globalenv()) && 
      identical(globalenv()$RUN_INTENSIVE_TESTS,TRUE))
  {
    #this test based on supplementary figure 1 in Sheppard et al, Nature Climate Change,
    #2016, doi: 10.1038/NCLIMATE2881. We used the wmf there, but we could also have used
    #the wpmf. The only difference between this and the above tests is we are here using aaft
    #significance testing
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
    nrd<-25
    res<-wpmf(dat,times,sigmethod="aaft",nrand=nrd)
    expect_equal(res$signif[[1]],"aaft")
    expect_equal(unname(res$signif[[2]]),nrd)
    expect_equal(class(res$signif$gt),"matrix")
    expect_equal(dim(get_values(res)),dim(res$signif$gt))
    
    #Make a plot to check visually. Expected to look like panel panel k of supp fig 1 in the
    #reference cited above
    #image(get_times(res),log2(get_timescales(res)),Mod(get_values(res)))
    #lines(c(1,100),log2(c(10,10)))
    #lines(c(1,100),log2(c(5,5)))
    #par(new=T)
    #contour(get_times(res),log2(get_timescales(res)),res$signif$gt,
    #        levels=.95,axes=FALSE,drawlabels=FALSE,
    #        frame.plot=FALSE)
    #It looked good so I commented it out, now just check future runs are always the same.
    expect_known_value(list(Mod(res$values[25:75,20:40]),res$signif),file="../vals/wpmf_testval_03",update=FALSE)
  }
})