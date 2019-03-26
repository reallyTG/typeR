library(wsyn)


### Name: wlm_methods
### Title: Basic methods for the 'wlm' class
### Aliases: wlm_methods summary.wlm print.wlm set_times.wlm
###   set_timescales.wlm set_coefs.wlm set_modval.wlm set_coher.wlm
###   set_dat.wlm set_wtopt.wlm set_norm.wlm set_wts.wlm get_times.wlm
###   get_timescales.wlm get_coefs.wlm get_modval.wlm get_coher.wlm
###   get_dat.wlm get_wtopt.wlm get_norm.wlm get_wts.wlm

### ** Examples

times<-1:30
dat<-list(v1=matrix(rnorm(300),10,30),v2=matrix(rnorm(300),10,30),v3=matrix(rnorm(300),10,30),
          v4=matrix(rnorm(300),10,30),v5=matrix(rnorm(300),10,30))
dat<-lapply(FUN=function(x){cleandat(x,times,1)$cdat},X=dat)
resp<-2
pred<-c(1,3,4)
norm<-"powall"
h<-wlm(dat,times,resp,pred,norm)
get_times(h)
summary(h)
print(h)




