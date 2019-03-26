library(wsyn)


### Name: wlm
### Title: Wavelet linear models
### Aliases: wlm

### ** Examples

times<-1:30
dat<-list(v1=matrix(rnorm(300),10,30),v2=matrix(rnorm(300),10,30),v3=matrix(rnorm(300),10,30),
          v4=matrix(rnorm(300),10,30),v5=matrix(rnorm(300),10,30))
dat<-lapply(FUN=function(x){cleandat(x,times,1)$cdat},X=dat)
resp<-2
pred<-c(1,3,4)
norm<-"powall"
res<-wlm(dat,times,resp,pred,norm)




