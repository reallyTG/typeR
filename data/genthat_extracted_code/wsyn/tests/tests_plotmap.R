context("plotmap")

test_that("test basic error checking",{
  #test that plotmap throws an error when fed something not a clust object
  object<-c("this","that","the other")
  expect_error(plotmap(object),"Error in plotmap: inclust must be a clust object")
  
  #test that plotmap throws an error if given a larger number of modules than can be plotted
  N<-5
  Tmax<-100
  rho<-0.5
  sig<-matrix(rho,N,N)
  diag(sig)<-1
  d<-t(cbind(mvtnorm::rmvnorm(Tmax,mean=rep(0,N),sigma=sig),
             mvtnorm::rmvnorm(Tmax,mean=rep(0,N),sigma=sig)))
  
  d<-cleandat(d,1:Tmax,1)$cdat
  coords<-data.frame(X=runif(N*2,1,10),Y=runif(N*2,1,10))
  
  cl1<-clust(dat=d,times=1:Tmax,coords=coords,method="pearson")
  cl1$clusters[[2]]<-1:(N*2)
  expect_error(plotmap(cl1),"Error in plotmap: more than 9 modules, plotmap cannot proceed")
})

test_that("tests on clust objects",{
  set.seed(101)
  N<-20
  Tmax<-500
  tim<-1:Tmax
  ts1<-sin(2*pi*tim/5)
  ts1s<-sin(2*pi*tim/5+pi/2)
  ts2<-sin(2*pi*tim/12)
  ts2s<-sin(2*pi*tim/12+pi/2)
  gp1A<-1:5
  gp1B<-6:10
  gp2A<-11:15
  gp2B<-16:20
  d<-matrix(NA,Tmax,N)
  d[,c(gp1A,gp1B)]<-ts1
  d[,c(gp2A,gp2B)]<-ts1s
  d[,c(gp1A,gp2A)]<-d[,c(gp1A,gp2A)]+matrix(ts2,Tmax,N/2)
  d[,c(gp1B,gp2B)]<-d[,c(gp1B,gp2B)]+matrix(ts2s,Tmax,N/2)
  d<-d+matrix(rnorm(Tmax*N,0,2),Tmax,N)
  d<-t(d)
  d<-cleandat(d,1:Tmax,1)$cdat
  coords<-data.frame(X=c(rep(1,10),rep(2,10)),Y=rep(c(1:5,7:11),times=2))
  cl1<-clust(dat=d,times=1:Tmax,coords=coords,method="ReXWT",tsrange=c(4,6))
  
  #all defaults
  Test_plotmap_1<-function(){plotmap(cl1)}
  vdiffr::expect_doppelganger(title="Test-plotmap-1",fig=Test_plotmap_1)
  
  #change spltlvl
  Test_plotmap_2<-function(){plotmap(cl1, spltlvl=1)}
  vdiffr::expect_doppelganger(title="Test-plotmap-2",fig=Test_plotmap_2)
  
  #shrink range of nodesize
  Test_plotmap_3<-function(){plotmap(cl1, nodesize=c(1,2))}
  vdiffr::expect_doppelganger(title="Test-plotmap-3",fig=Test_plotmap_3)
  
  #fix nodesize
  Test_plotmap_4<-function(){plotmap(cl1, nodesize=c(2,2))}
  vdiffr::expect_doppelganger(title="Test-plotmap-4",fig=Test_plotmap_4)
})
