library(NTS)


### Name: SMC
### Title: Generic Sequential Monte Carlo Method
### Aliases: SMC

### ** Examples

nobs= 100; pd= 0.95; ssw= 0.1; ssv= 0.5;
xx0= 0; ss0= 0.1; nyy= 50;
yrange= c(-80,80); xdim= 2; ydim= nyy;
mm= 10000
yr=yrange[2]-yrange[1]
par=list(ssw=ssw,ssv=ssv,nyy=nyy,pd=pd,yr=yr)
simu=simuTargetClutter(nobs,pd,ssw,ssv,xx0,ss0,nyy,yrange)
xx.init=matrix(nrow=2,ncol=mm)
xx.init[1,]=yrange[1]+runif(mm)*yr
xx.init[2,]=rep(0.1,mm)
resample.sch=rep.int(1,nobs)
out= SMC(Sstep.Clutter,nobs,simu$yy,mm,par,xx.init,xdim,ydim,resample.sch)



