library(lbiassurv)


### Name: lbfit.nonpar
### Title: Fits a Vardi corrected survival curve, a nonparametric survival
###   cuve estimation.
### Aliases: lbfit.nonpar
### Keywords: Kaplan-Miere estimator length-bias correction

### ** Examples

mydata=lbsample(20,family="exponential",par=list(rate=1))
noboot=lbfit.nonpar(time=mydata$time,censor=mydata$censor)
plot(noboot$survfun)
withboot=lbfit.nonpar(time=mydata$time,censor=mydata$censor,boot=TRUE)
x=seq(0,max(mydata$time)+1,length=500)
plot(x,withboot$survfun(x),type="l",col="blue",ylim=c(0,1))
points(x,withboot$lowerfun(x),type="l",col="red")
points(x,withboot$upperfun(x),type="l",col="red")



