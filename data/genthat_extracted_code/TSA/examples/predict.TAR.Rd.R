library(TSA)


### Name: predict.TAR
### Title: Prediction based on a fitted TAR model
### Aliases: predict.TAR
### Keywords: methods

### ** Examples

data(prey.eq)
prey.tar.1=tar(y=log(prey.eq),p1=4,p2=4,d=3,a=.1,b=.9,print=TRUE)
set.seed(2357125)
pred.prey=predict(prey.tar.1,n.ahead=60,n.sim=1000)
yy=ts(c(log(prey.eq),pred.prey$fit),frequency=1,start=1)
plot(yy,type='n',ylim=range(c(yy,pred.prey$pred.interval)),ylab='Log Prey',
xlab=expression(t))
lines(log(prey.eq))
lines(window(yy, start=end(prey.eq)[1]+1),lty=2)
lines(ts(pred.prey$pred.interval[2,],start=end(prey.eq)[1]+1),lty=2)
lines(ts(pred.prey$pred.interval[1,],start=end(prey.eq)[1]+1),lty=2)



