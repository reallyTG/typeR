library(wsyn)


### Name: wlmtest
### Title: Statistical comparison of wavelet linear models
### Aliases: wlmtest

### ** Examples

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




