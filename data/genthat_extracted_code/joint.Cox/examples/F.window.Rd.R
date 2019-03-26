library(joint.Cox)


### Name: F.window
### Title: Dynamic prediction of death under the joint frailty-copula model
### Aliases: F.window
### Keywords: Prediction Dynamic prediction

### ** Examples

w=1
par(mfrow=c(1,2))
F.window(time=1,X=0.2,width=w,Z1=1,Z2=1,beta1=1,beta2=1,eta=0.5,theta=8,
         alpha=1,g=rep(1,5),h=rep(1,5),xi1=0,xi3=3)
F.window(time=1,X=0.8,width=w,Z1=1,Z2=1,beta1=1,beta2=1,eta=0.5,theta=8,
         alpha=1,g=rep(1,5),h=rep(1,5),xi1=0,xi3=3)



