context("plotphase")

test_that("test the default method, which just throws an error",{
  object<-list("test","this","is")
  expect_error(plotphase(object),"Error in plotphase: method not defined for this class")
})

test_that("test for a tts object",{
  #use a made-up tts which is not a wt or anything else
  times<-1:100
  timescales<-1:100
  cplx<-complex(modulus=1,argument=seq(from=-pi,to=pi,length.out=100))
  values1<-matrix(cplx,length(times),length(timescales))
  tts1<-tts(times,timescales,values1)  
  
  Test_plotphase_tts_1<-function(){plotphase(object=tts1)}
  vdiffr::expect_doppelganger(title="Test-plotphase-tts-1",fig=Test_plotphase_tts_1)
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
  
  #make the coh object
  res<-coh(dat1=artsig_x,dat2=artsig_y,times=times,norm="powall",sigmethod="fast",nrand=500,
           f0=0.5,scale.max.input=28)
  
  #add ranks and bandp
  res<-bandtest(res,c(2,4))
  res<-bandtest(res,c(4,30))
  res<-bandtest(res,c(8,12))
  
  #more error checking
  expect_error(plotphase(res,bandprows="test"),"Error in plotphase.coh: non-numeric value for bandprows")
  expect_error(plotphase(res,bandprows=c(1,4)),"Error in plotphase.coh: bandprows must contain row numbers for bandp")
  
  #do the plot for testing
  Test_plotphase_coh<-function(){plotphase(res)}
  vdiffr::expect_doppelganger(title="Test-plotphase-coh",fig=Test_plotphase_coh)
})