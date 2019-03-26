library(joint.Cox)


### Name: F.prediction
### Title: Dynamic prediction of death
### Aliases: F.prediction
### Keywords: Prediction Dynamic prediction

### ** Examples

w=c(0,0.5,1,1.5,2)
par(mfrow=c(1,2))
F.prediction(time=1,X=0.8,widths=w,Z1=1,Z2=1,beta1=1,beta2=1,eta=0.5,theta=8,
         alpha=1,g=rep(1,5),h=rep(1,5),xi1=0,xi3=3)
F.prediction(time=1,X=1.5,widths=w,Z1=1,Z2=1,beta1=1,beta2=1,eta=0.5,theta=8,
         alpha=1,g=rep(1,5),h=rep(1,5),xi1=0,xi3=3)



