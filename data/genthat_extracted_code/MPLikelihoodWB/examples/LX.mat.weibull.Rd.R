library(MPLikelihoodWB)


### Name: LX.mat.weibull
### Title: Compensating factor for a possible mathematical disturbance
### Aliases: LX.mat.weibull

### ** Examples

dat <- data.weibull(n = 20, shape=2, regco=c(2,1.5,3,2.5))

par=c(1,1,1,1,1,1)

LX.mat.weibull(Y=log(dat$ftime),X=model.matrix(ftime~x1+x2+x3+x4,data=dat),
sigma=2,phi=matrix(par[-1],ncol=1),delta=dat$delta,whc=2)

par=c(1,1,1)

LX.mat.weibull(Y=log(dat$ftime),X=model.matrix(ftime~x1,data=dat),sigma=2,
phi=matrix(par[-1],ncol=1),delta=dat$delta,whc=2)



