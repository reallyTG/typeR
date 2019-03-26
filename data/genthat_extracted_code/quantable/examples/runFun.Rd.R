library(quantable)


### Name: runFun
### Title: running function (default median absolute deviation)
### Aliases: runFun

### ** Examples

x = rnorm(500)
x = c(x,rnorm(1000,3,2))
x = c(x,runif(1000,4,6))
y = runFun(x,k=51,func=mad)
hist(y)#[500:490]
y2 = runFun(x,k=51,func=median)
plot(x,pch="*")
lines(y2,col=2,lwd=3)
lines(y2+y,col=3,lwd=3)
lines(y2-y,col=3,lwd=3)
tic = runFun(x,k=51,func=function(x,...){mean(x)})
plot(x,pch=".")
abline(h=0,col=2)
lines(tic,col=3,lwd=3)



