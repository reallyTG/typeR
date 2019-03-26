library(MPLikelihoodWB)


### Name: MPLikelihoodWB-package
### Title: Modified Profile Likelihood Estimation for Weibull Shape and
###   Regression Parameters
### Keywords: Modified profile likelihood Profile likelihood Weibull
###   regression model

### ** Examples

# For modified profile likelihood estimation
dat <- data.weibull(n = 40, shape=2, regco=c(2,1.5,3,2.5))
Mprofile.wb(formula=ftime~x1+x2+x3+x4,censor="delta",data=dat)
survreg(Surv(ftime,delta)~x1+x2+x3+x4,data=dat,dist="weibull")

# For random dataset creation
data.weibull(n = 20)
data.weibull(n = 20, shape=1.7, regco=c(2,1,3,4))
data.weibull(n = 20, shape=1.5, ncorvar=4, correlated=TRUE)




