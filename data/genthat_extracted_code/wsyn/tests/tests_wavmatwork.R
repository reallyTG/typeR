context("wavmatwork")

test_that("test for agreement with coh results",{
  dat<-matrix(rnorm(3*50),3,50)
  times<-1:50
  dat<-cleandat(dat,times,2)$cdat
  
  res<-wavmatwork(dat,times,scale.min=2,scale.max.input=NULL,sigma=1.05,f0=1,
                  norm="powind",treatment="Mod")
  rescoh<-coh(dat[1,],dat[2,],times,norm="powind")
  expect_equal(Mod(rescoh$coher),res$wavarray[1,2,])
  
  res<-wavmatwork(dat,times,scale.min=2,scale.max.input=NULL,sigma=1.05,f0=1,
                  norm="powind",treatment="Re")
  rescoh<-coh(dat[1,],dat[2,],times,norm="powind")
  expect_equal(Re(rescoh$coher),res$wavarray[1,2,])
  
  res<-wavmatwork(dat,times,scale.min=2,scale.max.input=NULL,sigma=1.05,f0=1,
                  norm="phase",treatment="Mod")
  rescoh<-coh(dat[1,],dat[2,],times,norm="phase")
  expect_equal(Mod(rescoh$coher),res$wavarray[1,2,])
  
  res<-wavmatwork(dat,times,scale.min=2,scale.max.input=NULL,sigma=1.05,f0=1,
                  norm="phase",treatment="Re")
  rescoh<-coh(dat[1,],dat[2,],times,norm="phase")
  expect_equal(Re(rescoh$coher),res$wavarray[1,2,])

  res<-wavmatwork(dat,times,scale.min=2,scale.max.input=NULL,sigma=1.05,f0=1,
                  norm="none",treatment="Mod")
  rescoh<-coh(dat[1,],dat[2,],times,norm="none")
  expect_equal(Mod(rescoh$coher),res$wavarray[1,2,])
  
  res<-wavmatwork(dat,times,scale.min=2,scale.max.input=NULL,sigma=1.05,f0=1,
                  norm="none",treatment="Re")
  rescoh<-coh(dat[1,],dat[2,],times,norm="none")
  expect_equal(Re(rescoh$coher),res$wavarray[1,2,])
})