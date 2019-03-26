library(MPLikelihoodWB)


### Name: Mprofile.wb
### Title: Modified profile likelihood estimation of Weibull shape and
###   regression parameter
### Aliases: Mprofile.wb
### Keywords: Modified profile likelihood Profile likelihood Weibull
###   regression model

### ** Examples

dat <- data.weibull(n = 40, shape=2, regco=c(2,1.5,3,2.5))

Mprofile.wb(formula=ftime~x1+x2+x3+x4,censor="delta",data=dat)

survreg(Surv(ftime,delta)~x1+x2+x3+x4,data=dat,dist="weibull")



