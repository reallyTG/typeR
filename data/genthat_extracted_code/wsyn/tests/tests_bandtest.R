context("bandtest")

test_that("test the default method, which just throws an error",{
  object<-list("test","this","is")
  expect_error(bandtest(object),"Error in bandtest: method not defined for this class")
})

test_that("test for a coh object",{
  #this test based on supplementary figure 5 in Sheppard et al, Nature Climate Change, 
  #2016, doi: 10.1038/NCLIMATE2881. 
  
  #make the data
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
  
  #call coh
  cohobj<-coh(dat1=artsig_x,dat2=artsig_y,times=times,norm="powall",sigmethod="none",nrand=1000,
           f0=0.5,scale.max.input=28)
  
  #test error handling
  expect_error(bandtest(cohobj,c(2,10)),"Error in bandtest.coh: signif cannot be NA")
  cohobj<-coh(dat1=artsig_x,dat2=artsig_y,times=times,norm="powall",sigmethod="fast",nrand=1000,
              f0=0.5,scale.max.input=28)
  expect_error(bandtest(cohobj,"test"),"Error in bandtest.coh: band must be numeric")  
  expect_error(bandtest(cohobj,5),"Error in bandtest.coh: band must be a length-two numeric vector")  
  expect_error(bandtest(cohobj,c(1,2,5)),"Error in bandtest.coh: band must be a length-two numeric vector")  
  expect_error(bandtest(cohobj,c(31,35)),"Error in bandtest.coh: band must include some of the timescales")  
  
  #test timescales <=4 years
  cohobj<-bandtest(cohobj,c(2,4))
  expect_equal(class(cohobj$bandp),"data.frame")
  expect_equal(dim(cohobj$bandp),c(1,4))
  expect_gt(cohobj$bandp[1,3],.2)
  expect_equal(cohobj$bandp[1,1],2)
  expect_equal(cohobj$bandp[1,2],4)
  
  #test timescales > 4 years
  cohobj<-bandtest(cohobj,c(4.001,30))
  expect_equal(class(cohobj$bandp),"data.frame")
  expect_equal(dim(cohobj$bandp),c(2,4))
  expect_lt(cohobj$bandp[2,3],.01)
  expect_equal(cohobj$bandp[2,1],4.001)
  expect_equal(cohobj$bandp[2,2],30)
  
  #test case with only one timescale in the range
  cohobj<-bandtest(cohobj,c(10,10.1))
  expect_equal(class(cohobj$bandp),"data.frame")
  expect_equal(dim(cohobj$bandp),c(3,4))
  expect_lt(cohobj$bandp[3,3],.01)
  expect_equal(cohobj$bandp[3,1],10)
  expect_equal(cohobj$bandp[3,2],10.1)
})

