context("plotrank")

test_that("test for an actual coh object",{
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
  
  #make the coh object
  res<-coh(dat1=artsig_x,dat2=artsig_y,times=times,norm="powall",sigmethod="none",nrand=500,
           f0=0.5,scale.max.input=28)
  
  #do some error checking
  expect_error(plotrank(res),"Error in plotrank.coh: plotrank.coh needs a signif slot")
  
  #make the coh object with signif
  res<-coh(dat1=artsig_x,dat2=artsig_y,times=times,norm="powall",sigmethod="fast",nrand=500,
           f0=0.5,scale.max.input=28)
  
  #more error checking
  expect_error(plotrank(res,1.1),"Error in plotrank.coh: inappropriate value for sigthresh")
  
  #add ranks and bandp
  res<-bandtest(res,c(2,4))
  res<-bandtest(res,c(4,30))
  res<-bandtest(res,c(8,12))
  
  #more error checking
  expect_error(plotrank(res,bandprows="test"),"Error in plotrank.coh: non-numeric value for bandprows")
  expect_error(plotrank(res,bandprows=c(1,4)),"Error in plotrank.coh: bandprows must contain row numbers for bandp")
  
  #do the plot for testing
  Test_plotrank_coh<-function(){plotrank(res)}
  vdiffr::expect_doppelganger(title="Test-plotrank-coh",fig=Test_plotrank_coh)
  
  #do a case with a band that exceeds the timescales, but otherwise matches the above - 
  #should give the same thing
  res2<-bandtest(res,c(0,4))
  res2<-bandtest(res2,c(4,Inf))
  plotrank(res2)

  Test_plotrank_coh_2<-function(){plotrank(res2)}
  vdiffr::expect_doppelganger(title="Test-plotrank-coh-2",fig=Test_plotrank_coh_2)
})

test_that("test for an actual wlmtest pbject",{
  #this test partly based on the example data of supplementary figure 5 in Sheppard et al, 
  #Nature Climate Change, 2016, doi: 10.1038/NCLIMATE2881, plus some additional data. 
  
  #make the data
  set.seed(201)
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
  artsig_i<-matrix(rnorm(11*length(times)),11,length(times)) #the irrelevant
  artsig_x<-cleandat(artsig_x,times,1)$cdat
  artsig_y<-cleandat(artsig_y,times,1)$cdat
  artsig_i<-cleandat(artsig_i,times,1)$cdat
  
  dat<-list(driven=artsig_y,driver=artsig_x,irrelevant=artsig_i)
  resp<-1
  pred<-2:3
  norm<-"powall"
  wlmobj<-wlm(dat,times,resp,pred,norm)
  sigmethod<-"fft"
  nrand<-25
  res<-wlmtest(wlmobj,drop="driver",sigmethod,nrand=nrand)
  res<-bandtest(res,c(5,15))
  res<-bandtest(res,c(20,25))
  
  Test_plotrank_wlmtest<-function(){plotrank(object=res)}
  vdiffr::expect_doppelganger(title="Test-plotrank-wlmtest",fig=Test_plotrank_wlmtest)  
})