library(wsyn)


### Name: plotrank
### Title: Plots 'ranks' slot for 'coh' and 'wlmtest' objects
### Aliases: plotrank plotrank.coh plotrank.wlmtest plotrank.default

### ** Examples

#For a coh object
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
res<-coh(dat1=artsig_x,dat2=artsig_y,times=times,norm="powall",sigmethod="fast",
nrand=100,f0=0.5,scale.max.input=28)
#use larger nrand for a real application
res<-bandtest(res,c(2,4))
res<-bandtest(res,c(8,12))
plotrank(res)
  
#For a wlmtest object, see vignette




