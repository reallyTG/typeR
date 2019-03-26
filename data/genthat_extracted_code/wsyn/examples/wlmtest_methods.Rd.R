library(wsyn)


### Name: wlmtest_methods
### Title: Basic methods for the 'wlmtest' class
### Aliases: wlmtest_methods summary.wlmtest print.wlmtest
###   set_wlmobj.wlmtest set_drop.wlmtest set_signif.wlmtest
###   set_ranks.wlmtest set_bandp.wlmtest get_wlmobj.wlmtest
###   get_drop.wlmtest get_signif.wlmtest get_ranks.wlmtest
###   get_bandp.wlmtest

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
h<-wlmtest(wlmobj,drop,sigmethod,nrand=10)
get_times(get_wlmobj(h))
summary(h)
print(h)




