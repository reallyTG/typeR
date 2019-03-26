library(joint.Cox)


### Name: F.window.Weibull
### Title: Dynamic prediction of death under the joint frailty-copula model
###   (the Weibull baseline hazard functions)
### Aliases: F.window.Weibull
### Keywords: Prediction Dynamic prediction

### ** Examples

w=1
par(mfrow=c(1,2))
F.window.Weibull(time=1,X=0.2,width=w,Z1=1,Z2=1,beta1=1,beta2=1,eta=0.5,theta=8,
                 alpha=1,scale1=1,shape1=1,scale2=1,shape2=1,xi1=0,xi3=3)
F.window.Weibull(time=1,X=0.8,width=w,Z1=1,Z2=1,beta1=1,beta2=1,eta=0.5,theta=8,
                 alpha=1,scale1=1,shape1=1,scale2=1,shape2=1,xi1=0,xi3=3)



