context("plotmag")

test_that("test the default method, which just throws an error",{
  object<-list("test","this","is")
  expect_error(plotmag(object),"Error in plotmag: method not defined for this class")
})

test_that("test for an actual wt object",{
  #because plotmag.wt does not exist (the wt method is inherited from tts), we are effectively testing the tts method here
  
  #**this test based on the first example in fig S2 of Sheppard et al, "Synchrony is more than its
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
  
  Test_plotmag_wt_1<-function(){plotmag(object=res)}
  vdiffr::expect_doppelganger(title="Test-plotmag-wt-1",fig=Test_plotmag_wt_1)
  
  #try without the colorbar
  Test_plotmag_wt_2<-function(){plotmag(object=res,colorbar=FALSE)}
  vdiffr::expect_doppelganger(title="Test-plotmag-wt-2",fig=Test_plotmag_wt_2)
  
  #use neat=T
  Test_plotmag_wt_3<-function(){plotmag(object=res,neat=TRUE)}
  vdiffr::expect_doppelganger(title="Test-plotmag-wt-3",fig=Test_plotmag_wt_3)

  #try wider z axis limits, and with a test title
  Test_plotmag_wt_4<-function(){plotmag(object=res,zlim=c(-1,6),title="test")}
  vdiffr::expect_doppelganger(title="Test-plotmag-wt-4",fig=Test_plotmag_wt_4)
  
  #**this test based on the second example in fig S2 of Sheppard et al, "Synchrony is more than its
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
  
  Test_plotmag_wt_5<-function(){plotmag(object=res)}
  vdiffr::expect_doppelganger(title="Test-plotmag-wt-5",fig=Test_plotmag_wt_5)
})

test_that("test for actual wmf and wpmf objects",{

  #***wmf
  
  #because plotmag.wt does not exist (the wt method is inherited from tts), we are effectively testing the tts method here  
  
  #**this test based on supplementary figure 1 in Sheppard et al, Nature Climate Change, 
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
  
  Test_plotmag_wmf_1<-function(){plotmag(object=res)}
  vdiffr::expect_doppelganger(title="Test-plotmag-wmf-1",fig=Test_plotmag_wmf_1)
  
  #try without the colorbar
  Test_plotmag_wmf_2<-function(){plotmag(object=res,colorbar=FALSE)}
  vdiffr::expect_doppelganger(title="Test-plotmag-wmf-2",fig=Test_plotmag_wmf_2)
  
  #use neat=T
  Test_plotmag_wmf_3<-function(){plotmag(object=res,neat=TRUE)}
  vdiffr::expect_doppelganger(title="Test-plotmag-wmf-3",fig=Test_plotmag_wmf_3)
  
  #try wider z axis limits, and with a test title
  Test_plotmag_wmf_4<-function(){plotmag(object=res,zlim=c(-1,6),title="test")}
  vdiffr::expect_doppelganger(title="Test-plotmag-wmf-4",fig=Test_plotmag_wmf_4)

  #***wpmf, quick signif method
  
  #**this test based on supplementary figure 1 in Sheppard et al, Nature Climate Change, 
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
  
  Test_plotmag_wpmf_quick<-function(){plotmag(object=res)}
  vdiffr::expect_doppelganger(title="Test-plotmag-wpmf-quick",fig=Test_plotmag_wpmf_quick)

  #***wpmf, fft signif method

  if (exists(x="RUN_INTENSIVE_TESTS",envir=globalenv()) && 
      identical(globalenv()$RUN_INTENSIVE_TESTS,TRUE))
  {
    #**this test based on supplementary figure 1 in Sheppard et al, Nature Climate Change, 
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
    res<-wpmf(dat,times,sigmethod="fft",nrand=25)
    
    Test_plotmag_wpmf_fft<-function(){plotmag(object=res)}
    vdiffr::expect_doppelganger(title="Test-plotmag-wpmf-fft",fig=Test_plotmag_wpmf_fft)
  }

  #***wpmf, aaft signif method

  if (exists(x="RUN_INTENSIVE_TESTS",envir=globalenv()) && 
      identical(globalenv()$RUN_INTENSIVE_TESTS,TRUE))
  {
    #**this test based on supplementary figure 1 in Sheppard et al, Nature Climate Change, 
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
    res<-wpmf(dat,times,sigmethod="aaft",nrand=20)
    
    Test_plotmag_wpmf_aaft<-function(){plotmag(object=res)}
    vdiffr::expect_doppelganger(title="Test-plotmag-wpmf-aaft",fig=Test_plotmag_wpmf_aaft)
  }
})

test_that("tests for a actual coh and wlmtest objects",{
  #***coh objects
  
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
  res<-coh(dat1=artsig_x,dat2=artsig_y,times=times,norm="powall",sigmethod="fast",nrand=500,
           f0=0.5,scale.max.input=28)
  
  #do some error checking
  expect_error(plotmag(res,sigthresh=1.1),"Error in plotmag.coh: inappropriate value for sigthresh")
  
  #add ranks and bandp
  res<-bandtest(res,c(2,4))
  res<-bandtest(res,c(4,30))
  res<-bandtest(res,c(8,12))

  #more error checking
  expect_error(plotmag(res,bandprows="test"),"Error in plotmag.coh: non-numeric value for bandprows")
  expect_error(plotmag(res,bandprows=c(1,4)),"Error in plotmag.coh: bandprows must contain row numbers for bandp")
  
  #do the plot for testing
  Test_plotmag_coh<-function(){plotmag(object=res)}
  vdiffr::expect_doppelganger(title="Test-plotmag-coh",fig=Test_plotmag_coh)

  #***wlmtest objects
  
  if (exists(x="RUN_INTENSIVE_TESTS",envir=globalenv()) && 
      identical(globalenv()$RUN_INTENSIVE_TESTS,TRUE))
  {
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
    
    Test_plotmag_wlmtest<-function(){plotmag(object=res)}
    vdiffr::expect_doppelganger(title="Test-plotmag-wlmtest",fig=Test_plotmag_wlmtest)  
  }
})
