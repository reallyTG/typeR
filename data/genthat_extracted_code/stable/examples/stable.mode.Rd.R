library(stable)


### Name: stable.mode
### Title: Mode of a Stable Distribution
### Aliases: stable.mode
### Keywords: distribution

### ** Examples


x <- seq(-5,5,by=0.1)
plot(x,dstable(x,loc=0,disp=1,skew=-1,tail=1.5),type="l",ylab="f(x)")
xhat <- stable.mode(loc=0,disp=1,skew=-1,tail=1.5)$ytilde
fxhat <- dstable(xhat,loc=0,disp=1,skew=-1,tail=1.5)
lines(c(xhat,xhat),c(0,fxhat),lty="dotted")




