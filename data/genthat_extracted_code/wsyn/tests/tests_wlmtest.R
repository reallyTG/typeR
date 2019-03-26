context("wlmtest")

test_that("test error checking",{
  set.seed(101)
  times<-1:30
  dat<-list(v1=matrix(rnorm(300),10,30),v2=matrix(rnorm(300),10,30),v3=matrix(rnorm(300),10,30),
            v4=matrix(rnorm(300),10,30),v5=matrix(rnorm(300),10,30))
  dat<-lapply(FUN=function(x){cleandat(x,times,1)$cdat},X=dat)
  resp<-1
  pred<-2:3
  norm<-"powall"
  res<-wlm(dat,times,resp,pred,norm)
  drop<-4
  sigmethod<-"fft"
  expect_error(wlmtest(wlmobj=res,drop,sigmethod,nrand=1000),
               "Error in wlmtest: drop must contain names or indices of predictors used in fitting wlm")
  drop<-"v4"
  expect_error(wlmtest(wlmobj=res,drop,sigmethod,nrand=1000),
               "Error in wlmtest: drop must contain names or indices of predictors used in fitting wlm")
  drop<-c(3,3)
  expect_error(wlmtest(wlmobj=res,drop,sigmethod,nrand=1000),
               "Error in wlmtest: drop must not have repeat entries")
  drop<-3
  sigmethod<-"test"
  expect_error(wlmtest(wlmobj=res,drop,sigmethod,nrand=1000),
               "Error in wlmtest: bad value for sigmethod")
})

test_that("test that results are in the right format",{
  set.seed(101)
  times<-1:30
  dat<-list(v1=matrix(rnorm(300),10,30),v2=matrix(rnorm(300),10,30),v3=matrix(rnorm(300),10,30),
            v4=matrix(rnorm(300),10,30),v5=matrix(rnorm(300),10,30))
  dat<-lapply(FUN=function(x){cleandat(x,times,1)$cdat},X=dat)
  resp<-1
  pred<-2:3
  norm<-"powall"
  wlmobj<-wlm(dat,times,resp,pred,norm)
  drop<-3
  sigmethod<-"fft"
  res<-wlmtest(wlmobj,drop,sigmethod,nrand=10)
  
  expect_equal(class(res),c("wlmtest","list"))
  expect_equal(wlmobj,res$wlmobj)
  expect_equal(drop,res$drop)
  expect_equal(class(res$signif),"list")
  expect_equal(names(res$signif),c("sigmethod","coher","scoher"))
  expect_equal(length(res$wlmobj$timescales),length(res$signif$coher))
  expect_equal(dim(res$signif$scoher),c(10,length(res$wlmobj$timescales)))  
  expect_equal(class(res$signif$coher),"complex")  
  expect_equal(class(res$signif$scoher[1,1]),"complex")  
  expect_equal(is.na(res$ranks),TRUE)
  expect_equal(is.na(res$bandp),TRUE)
})

test_that("test for reasonableness on an example",{
  #this test partly based on the example data of supplementary figure 5 in Sheppard et al, 
  #Nature Climate Change, 2016, doi: 10.1038/NCLIMATE2881, plus some additional data. 
  
  #make the data
  set.seed(301)
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
  res_di<-wlmtest(wlmobj,drop="irrelevant",sigmethod,nrand=nrand)
  
  #this also unit tests addranks and bandtest
  #res_di<-addranks(res_di)
  res_di<-bandtest(res_di,c(5,15))
  expect_gt(res_di$bandp[1,3],.05)
  
  if (exists(x="RUN_INTENSIVE_TESTS",envir=globalenv()) && 
      identical(globalenv()$RUN_INTENSIVE_TESTS,TRUE))
  {
    res_dd<-wlmtest(wlmobj,drop="driver",sigmethod,nrand=nrand)
    #res_dd<-addranks(res_dd)
    res_dd<-bandtest(res_dd,c(5,15))
    expect_lt(res_dd$bandp[1,3],.05)
  }
  
  #h<-data.frame(ts=res$wlmobj$timescales,
  #           ind=colSums(Mod(res_di$signif$scoher)<matrix(rep(Mod(res_di$signif$coher),each=nrand),nrow=nrand)),
  #           dri=colSums(Mod(res_dd$signif$scoher)<matrix(rep(Mod(res_dd$signif$coher),each=nrand),nrow=nrand)))
  #plot(log(1/h$ts),h$ind,
  #     type='l',xaxt="n")
  #xlocs<-c(min(h$ts),pretty(h$ts,n=8))
  #graphics::axis(side=1,at=log(1/xlocs),labels=xlocs) 
  #lines(log(1/h$ts),h$dri,
  #      col='red')
  #lines(log(1/c(10,10)),c(0,nrand),lty="dashed")
  #lines(range(log(1/h$ts)),.95*rep(nrand,2))
})
  