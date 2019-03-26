context("syncexpl")

test_that("test",{
  #this test partly based on the example data of supplementary figure 5 in Sheppard et al, 
  #Nature Climate Change, 2016, doi: 10.1038/NCLIMATE2881, plus some additional data. 
  
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
  artsig_i<-matrix(rnorm(11*length(times)),11,length(times)) #the irrelevant
  artsig_x<-cleandat(artsig_x,times,1)$cdat
  artsig_y<-cleandat(artsig_y,times,1)$cdat
  artsig_i<-cleandat(artsig_i,times,1)$cdat
  
  dat<-list(driven=artsig_y,driver=artsig_x,irrelevant=artsig_i)
  resp<-1
  pred<-2:3
  norm<-"powall"
  wlmobj<-wlm(dat,times,resp,pred,norm)
  
  res<-syncexpl(wlmobj)
  
  #test for correct format
  expect_s3_class(res,"data.frame")
  expect_equal(dim(res)[1],length(get_timescales(wlmobj)))
  expect_equal(names(res),c("timescales","sync","syncexpl","crossterms",
                            "resids","driver","irrelevant","interactions",
                            "driver_irrelevant"))
  
  #test for consistency between the way cross terms were computed and 
  #another way
  d<-wlmobj$wts[[1]]-wlmobj$modval
  nmodval<-normforcoh(wlmobj$modval,"powall")
  ct2<-matrix(0,length(wlmobj$times),length(wlmobj$timescales))
  for (lc1 in 1:11)
  {
    for (lc2 in 1:11)
    {
      h<-2*Re(nmodval[lc1,,]*Conj(d[lc2,,])*
        matrix(rep(wlmobj$coher,each=length(wlmobj$times)),
              length(wlmobj$times),length(wlmobj$timescales)))/(11^2)
      ct2<-ct2+h
    }
  }
  ct2<-apply(FUN=mean,X=ct2,MARGIN=2,na.rm=T)
  expect_equal(res$crossterms,ct2)
  
  #various constituents should sum to others
  expect_equal(res$syncexpl+res$crossterms+res$resids,res$sync)
  expect_equal(res$interactions,res$driver_irrelevant)
  expect_equal(res$syncexpl,res$driver+res$irrelevant+res$interactions)
  
  #just do some plotting to look at results
  #plot(res$timescales,res$sync,type='l',col='red',ylim=range(0,res[,c("sync")]))
  #lines(res$timescales,res$resids,type='l',lty="dashed") 
  #lines(res$timescales,res$crossterms,type='l',lty="dashed",col="green")
  #lines(res$timescales,res$syncexpl,type='l')
  #these look good
  
  #more plotting
  #plot(res$timescales,res$sync,type='l',
  #     ylim=range(0,res[,c("sync","syncexpl","driver","irrelevant")]))
  #lines(res$timescales,res$syncexpl,type='l',lty="dashed")
  #lines(res$timescales,res$driver,type='l',col='red')
  #lines(res$timescales,res$irrelevant,col='green')
  #lines(res$timescales,res$interactions,col='orange')
  #looks good
  
  #since the plots looked good, just test for consistency through time
  expect_known_value(res,file="../vals/syncexpl_testval_01",update=FALSE)
})
