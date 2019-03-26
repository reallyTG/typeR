library(wsyn)


### Name: predsync
### Title: Predicted synchrony of a wavelet linear model
### Aliases: predsync predsync.wlm

### ** Examples

times<-(-3:100)
ts1<-sin(2*pi*times/10)
ts2<-5*sin(2*pi*times/3)
artsig_x<-matrix(NA,11,length(times)) #the driver
for (counter in 1:11)
{
  artsig_x[counter,]<-ts1+ts2+rnorm(length(times),mean=0,sd=.5)
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
artsig_y<-artsig_y+matrix(rnorm(length(times)*11,mean=0,sd=1),11,length(times))
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

res<-predsync(wlmobj)




