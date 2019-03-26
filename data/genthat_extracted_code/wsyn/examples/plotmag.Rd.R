library(wsyn)


### Name: plotmag
### Title: For plotting the magnitude of values in 'tts', 'coh' and
###   'wlmtest' objects
### Aliases: plotmag plotmag.tts plotmag.wt plotmag.wmf plotmag.wpmf
###   plotmag.coh plotmag.wlmtest plotmag.default

### ** Examples

#For a wt object
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
plotmag(res)

#For a wmf object
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
plotmag(res)

#similar calls for wpmf, coh, wlm, wlmtest objects
#see documentation 




