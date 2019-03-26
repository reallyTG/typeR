library(ssmsn)


### Name: ssmsn
### Title: Scale-Shape Mixtures of Skew-Normal Distributions
### Aliases: ssmsn dssmsn rssmsn
### Keywords: Shape-scale mixture of skew-normal distributions ssmsn models

### ** Examples


rSTT  <- rssmsn(n=1000,mu=-4,sigma2=1,lambda=1,nu=c(3,4),"skew.t.t");hist(rSTT)
rSGLN <- rssmsn(n=1000,mu=-4,sigma2=1,lambda=1,nu=3,"skew.generalized.laplace.normal");hist(rSGLN)
rSSN  <- rssmsn(n=1000,mu=-4,sigma2=1,lambda=1,nu=3,"skew.slash.normal");hist(rSSN)

dSTT  <- dssmsn(0.5,mu=-4,sigma2=1,lambda=1,nu=c(3,4),"skew.t.t")
dSGLN <- dssmsn(0.5,mu=-4,sigma2=1,lambda=1,nu=3,"skew.generalized.laplace.normal")
dSSN  <- dssmsn(0.5,mu=-4,sigma2=1,lambda=1,nu=3,"skew.slash.normal")




