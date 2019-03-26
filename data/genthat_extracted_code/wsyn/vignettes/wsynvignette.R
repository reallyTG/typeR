## ----seed_setter_1, echo=F-----------------------------------------------
set.seed(101)

## ----wt_example_1_ts1----------------------------------------------------
time1<-1:100
time2<-101:200
times<-c(time1,time2)
  
ts1p1<-sin(2*pi*time1/15)
ts1p2<-0*time2
ts1<-c(ts1p1,ts1p2)
  
ts<-ts1

## ----wt_example_1_ts2----------------------------------------------------
ts2p1<-0*time1
ts2p2<-sin(2*pi*time2/8)
ts2<-c(ts2p1,ts2p2)
  
ts<-ts+ts2

## ----wt_example_1_ts3----------------------------------------------------
ts3<-rnorm(200,mean=0,sd=0.5)
ts<-ts+ts3

## ----wt_example_1_wt-----------------------------------------------------
library(wsyn)
ts<-cleandat(ts,times,clev=1)
wtres<-wt(ts$cdat,times)
class(wtres)
names(wtres)

## ----wt_example_1_plot, results=FALSE------------------------------------
plotmag(wtres)

## ----wt_example_1_plotphase, results=FALSE-------------------------------
plotphase(wtres)

## ----wt_example_1_power, results=FALSE-----------------------------------
h<-power(wtres)
plot(log(1/h$timescales),h$power,type='l',lty="solid",xaxt="n",
     xlab="Timescales",ylab="Power")
xlocs<-c(min(h$timescales),pretty(h$timescales,n=8))
graphics::axis(side=1,at=log(1/xlocs),labels=xlocs) 

## ----wt_example_1_psmeth-------------------------------------------------
print(wtres)
summary(wtres)

## ----seed_setter_2, echo=F-----------------------------------------------
set.seed(201)

## ----wt_example_2, results=FALSE-----------------------------------------
timeinc<-1 #one sample per year
startfreq<-0.2 #cycles per year
endfreq<-0.1 #cycles per year
times<-1:200
f<-seq(from=startfreq,length.out=length(times),to=endfreq) #frequency for each sample
phaseinc<-2*pi*cumsum(f*timeinc)
t.series<-sin(phaseinc)
t.series<-cleandat(t.series,times,1)$cdat
res<-wt(t.series, times)
plotmag(res)
plotphase(res)

## ----seed_setter_3, echo=F-----------------------------------------------
set.seed(101)

## ----wpmf_example_1_dat_1------------------------------------------------
times1<-0:50
times2<-51:100
times<-c(times1,times2)
ts1<-c(sin(2*pi*times1/10),sin(2*pi*times2/5))+1.1

## ----wpmf_example_1_dat_2------------------------------------------------
dat<-matrix(NA,11,length(times))
for (counter in 1:dim(dat)[1])
{
  ts2<-3*sin(2*pi*times/3+2*pi*runif(1))+3.1
  ts3<-rnorm(length(times),0,1.5)
  dat[counter,]<-ts1+ts2+ts3    
}
dat<-cleandat(dat,times,1)$cdat

## ----wpmf_example_1_plotts-----------------------------------------------
plot(times,dat[1,]/10+1,type='l',xlab="Time",ylab="Time series index",ylim=c(0,12))
for (counter in 2:dim(dat)[1])
{
  lines(times,dat[counter,]/10+counter)
}

## ----wpmf_example_1_cors-------------------------------------------------
cmat<-cor(t(dat))
diag(cmat)<-NA
cmat<-as.vector(cmat)
cmat<-cmat[!is.na(cmat)]
hist(cmat,30,xlab="Pearson correlation",ylab="Count")

## ----wpmf_example_1, results=FALSE---------------------------------------
res<-wpmf(dat,times,sigmethod="quick")
plotmag(res)

## ----wmf_example_1, results=FALSE----------------------------------------
res<-wpmf(dat,times)
plotmag(res)

## ----seed_setter_4, echo=F-----------------------------------------------
set.seed(101)

## ----coh_example_dat_driver----------------------------------------------
  times<-(-3:100)
  ts1<-sin(2*pi*times/10)
  ts2<-5*sin(2*pi*times/3)
  x<-matrix(NA,11,length(times)) #the driver (environmental) variable
  for (counter in 1:11)
  {
    x[counter,]=ts1+ts2+rnorm(length(times),mean=0,sd=1.5)
  }

## ----coh_example_dat_env-------------------------------------------------
  times<-0:100
  y<-matrix(NA,11,length(times)) #the driven (biological) variable
  for (counter1 in 1:11)
  {
    for (counter2 in 1:101)
    {
      y[counter1,counter2]<-mean(x[counter1,counter2:(counter2+2)])
    }
  }
  y<-y+matrix(rnorm(length(times)*11,mean=0,sd=3),11,length(times))
  x<-x[,4:104]
  x<-cleandat(x,times,1)$cdat 
  y<-cleandat(y,times,1)$cdat

## ----cors_range_widely---------------------------------------------------
allcors<-c()
for (counter in 1:dim(x)[1])
{
  allcors[counter]<-cor(x[counter,],y[counter,])
}
allcors

## ----coh_example_call----------------------------------------------------
res<-coh(dat1=x,dat2=y,times=times,norm="powall",
         sigmethod="fftsurrog1",nrand=100,
         f0=0.5,scale.max.input=28)

## ----coh_plot, results=FALSE---------------------------------------------
plotmag(res)

## ----coh_example_call_fast, results=FALSE--------------------------------
res<-coh(dat1=x,dat2=y,times=times,norm="powall",
         sigmethod="fast",nrand=10000,
         f0=0.5,scale.max.input=28)
plotmag(res)

## ----bandtest------------------------------------------------------------
res<-bandtest(res,c(8,12))

## ----bandtest_display_bandp----------------------------------------------
get_bandp(res)

## ----bandtest2-----------------------------------------------------------
res<-bandtest(res,c(2,4))
get_bandp(res)

## ----display_p_1, results=FALSE------------------------------------------
plotmag(res)

## ----plotrank_1, results=FALSE-------------------------------------------
plotrank(res)

## ----plotphase_1, results=FALSE------------------------------------------
plotphase(res)

## ----seed_setter_5, echo=F-----------------------------------------------
set.seed(3221) #221 #3221

## ----driver_1------------------------------------------------------------
lts<-12
sts<-3
mats<-3
times<-seq(from=-mats,to=100)
ts1<-sin(2*pi*times/lts)
ts2<-sin(2*pi*times/sts)
numlocs<-10
d1<-matrix(NA,numlocs,length(times)) #the first driver
for (counter in 1:numlocs)
{
  d1[counter,]<-ts1+ts2+rnorm(length(times),mean=0,sd=1.5)
}

## ----driver_2------------------------------------------------------------
ts1<-sin(2*pi*times/lts)
ts2<-sin(2*pi*times/sts)
d2<-matrix(NA,numlocs,length(times)) #the second driver
for (counter in 1:numlocs)
{
  d2[counter,]<-ts1+ts2+rnorm(length(times),mean=0,sd=1.5)
}

## ----dirrel--------------------------------------------------------------
dirrel<-matrix(NA,numlocs,length(times)) #the irrelevant env var
for (counter in 1:numlocs)
{
  dirrel[counter,]<-rnorm(length(times),mean=0,sd=1.5)
}

## ----popdat--------------------------------------------------------------
pops<-matrix(NA,numlocs,length(times)) #the populations
for (counter in (mats+1):length(times))
{
  aff1<-apply(FUN=mean,X=d1[,(counter-mats):(counter-1)],MARGIN=1)
  aff2<-d2[,counter-1]
  pops[,counter]<-aff1+aff2+rnorm(numlocs,mean=0,sd=3)
}
pops<-pops[,times>=0]
d1<-d1[,times>=0]
d2<-d2[,times>=0]
dirrel<-dirrel[,times>=0]
times<-times[times>=0]

## ----wmfs_wlmexample, results=FALSE--------------------------------------
dat<-list(pops=pops,d1=d1,d2=d2,dirrel=dirrel)
dat<-lapply(FUN=function(x){cleandat(x,times,1)$cdat},X=dat)
wmfpop<-wmf(dat$pops,times,scale.max.input=28)
plotmag(wmfpop)
wmfd1<-wmf(dat$d1,times,scale.max.input=28)
plotmag(wmfd1)
wmfd2<-wmf(dat$d2,times,scale.max.input=28)
plotmag(wmfd2)

## ----fit_mod_allpred-----------------------------------------------------
wlm_all<-wlm(dat,times,resp=1,pred=2:4,norm="powall",scale.max.input=28)

## ----sometests-----------------------------------------------------------
wlm_all_dropi<-wlmtest(wlm_all,drop="dirrel",sigmethod="fft",nrand=100)
wlm_all_drop1<-wlmtest(wlm_all,drop="d1",sigmethod="fft",nrand=100)
wlm_all_drop2<-wlmtest(wlm_all,drop="d2",sigmethod="fft",nrand=100)

## ----dropdirrel_1, results=FALSE-----------------------------------------
blong<-c(11,13)
bshort<-c(2,4)
wlm_all_dropi<-bandtest(wlm_all_dropi,band=blong)
wlm_all_dropi<-bandtest(wlm_all_dropi,band=bshort)
plotmag(wlm_all_dropi)
plotrank(wlm_all_dropi)

## ----dropd1_1, results=FALSE---------------------------------------------
wlm_all_drop1<-bandtest(wlm_all_drop1,band=blong)
wlm_all_drop1<-bandtest(wlm_all_drop1,band=bshort)
plotmag(wlm_all_drop1)
plotrank(wlm_all_drop1)

## ----dropd2_1, results=FALSE---------------------------------------------
wlm_all_drop2<-bandtest(wlm_all_drop2,band=blong)
wlm_all_drop2<-bandtest(wlm_all_drop2,band=bshort)
plotmag(wlm_all_drop2)
plotrank(wlm_all_drop2)

## ----shortts_syncexpl----------------------------------------------------
se<-syncexpl(wlm_all)
se_short<-se[se$timescales>=bshort[1] & se$timescales<=bshort[2],]
round(100*colMeans(se_short[,c(3:12)])/mean(se_short$sync),4)

## ----longts_syncexpl-----------------------------------------------------
se_long<-se[se$timescales>=blong[1] & se$timescales<=blong[2],]
round(100*colMeans(se_long[,c(3:12)])/mean(se_long$sync),4)

## ----examp_predsync_1----------------------------------------------------
pres<-predsync(wlm_all)
plotmag(pres)
plotmag(wmfpop)

## ----examp_predsync_2----------------------------------------------------
wlm_d1<-wlm(dat,times,resp=1,pred=2,norm="powall",scale.max.input=28)
pres<-predsync(wlm_d1)
plotmag(pres)

## ----artificial_clustering_data------------------------------------------
N<-5
Tmax<-100
rho<-0.5
sig<-matrix(rho,N,N)
diag(sig)<-1
d<-t(cbind(mvtnorm::rmvnorm(Tmax,mean=rep(0,N),sigma=sig),
           mvtnorm::rmvnorm(Tmax,mean=rep(0,N),sigma=sig)))
d<-cleandat(d,1:Tmax,1)$cdat

## ----pearson_synmat------------------------------------------------------
sm<-synmat(d,1:Tmax,method="pearson")
fields::image.plot(1:10,1:10,sm,col=heat.colors(20))

## ----freq_spec_synmat----------------------------------------------------
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

## ----detect_tsspecific_sync----------------------------------------------
sm5<-synmat(dat=d,times=1:Tmax,method="ReXWT",tsrange=c(4,6))
fields::image.plot(1:N,1:N,sm5,col=heat.colors(20))
sm12<-synmat(dat=d,times=1:Tmax,method="ReXWT",tsrange=c(11,13))
fields::image.plot(1:N,1:N,sm12,col=heat.colors(20))

## ----abuse_cor-----------------------------------------------------------
sm<-synmat(dat=d,times=1:Tmax,method="pearson")
fields::image.plot(1:N,1:N,sm,col=heat.colors(20))

## ----clust_demo----------------------------------------------------------
#make some artificial coordinates for the geographic locations of where data were measured
coords<-data.frame(X=c(rep(1,10),rep(2,10)),Y=rep(c(1:5,7:11),times=2))

#create clusters based on the 5-year timescale range and map them using coords
cl5<-clust(dat=d,times=1:Tmax,coords=coords,method="ReXWT",tsrange=c(4,6))
get_clusters(cl5) #the first element of the list is always all 1s - prior to any splits

#call the mapper here
plotmap(cl5)

#plot mean time series for each module
plot(get_times(cl5)[1:100],get_mns(cl5)[[2]][1,1:100],type='l',col='red',
     ylim=range(get_mns(cl5)),xlab="Time step",ylab="Mean pop.")
lines(get_times(cl5)[1:100],get_mns(cl5)[[2]][2,1:100],type='l',col='green')
legend(x="topright",legend=c("mod1","mod2"),lty=c(1,1),col=c("red","green"))

#create wavelet mean fields for each module and plot
cl5<-addwmfs(cl5)
plotmag(get_wmfs(cl5)[[2]][[1]])
plotmag(get_wmfs(cl5)[[2]][[2]])

#create clusters based on the 12-year timescale range and map them using coords
cl12<-clust(dat=d,times=1:Tmax,coords=coords,method="ReXWT",tsrange=c(11,13))
cl12$clusters

#call the mapper here
plotmap(cl12)

#plot mean time series for each module
plot(get_times(cl12)[1:100],get_mns(cl12)[[2]][1,1:100],type='l',col='red',
     ylim=range(get_mns(cl12)),xlab="Time step",ylab="Mean pop.")
lines(get_times(cl12)[1:100],get_mns(cl12)[[2]][2,1:100],type='l',col='green')
legend(x="topright",legend=c("mod1","mod2"),lty=c(1,1),col=c("red","green"))

#create wavelet mean fields for each module and plot
cl12<-addwmfs(cl12)
plotmag(get_wmfs(cl12)[[2]][[1]])
plotmag(get_wmfs(cl12)[[2]][[2]])

