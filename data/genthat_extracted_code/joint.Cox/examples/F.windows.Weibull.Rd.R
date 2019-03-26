library(joint.Cox)


### Name: F.windows.Weibull
### Title: Dynamic prediction of death under the joint frailty-copula model
###   (the Weibull baseline hazard functions)
### Aliases: F.windows.Weibull
### Keywords: Prediction Dynamic prediction

### ** Examples

w=c(0,0.5,1,1.5,2)
par(mfrow=c(1,2))
F.windows.Weibull(time=1,X=0.2,widths=w,Z1=1,Z2=1,beta1=1,beta2=1,eta=0.5,theta=8,
                  alpha=1,scale1=1,shape1=1,scale2=1,shape2=1,xi1=0,xi3=3)
F.windows.Weibull(time=1,X=0.8,widths=w,Z1=1,Z2=1,beta1=1,beta2=1,eta=0.5,theta=8,
                  alpha=1,scale1=1,shape1=1,scale2=1,shape2=1,xi1=0,xi3=3)



