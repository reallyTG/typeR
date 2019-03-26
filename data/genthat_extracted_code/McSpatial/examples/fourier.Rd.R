library(McSpatial)


### Name: fourier
### Title: Fourier expansion smoothing
### Aliases: fourier
### Keywords: Parmametric Models Series Expansions

### ** Examples

set.seed(23849103)
n = 1000
x <- runif(n,0,2*pi)
x <- sort(x)
ybase <- x - .1*(x^2) + sin(x) - cos(x) -.5*sin(2*x) + .5*cos(2*x)
sig = sd(ybase)/2
y <- ybase + rnorm(n,0,sig)

par(ask=TRUE)
plot(x,y)
lines(x,ybase,col="red")

fit <- fourier(y~x,minq=1,maxq=10)
plot(x,ybase,type="l",xlab="x",ylab="y")
lines(x,fit$yhat,col="red")
legend("topright",c("Base","Fourier"),col=c("black","red"),lwd=1)





