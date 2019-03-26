library(McSpatial)


### Name: smooth12
### Title: Univariate or Bivariate Interpolation
### Aliases: smooth12

### ** Examples

set.seed(484849)
n = 1000
x <- runif(n,-2*pi,2*pi)
x <- sort(x)
y <- sin(x) + cos(x) - .5*sin(2*x) - .5*cos(2*x) + sin(3*x)/3 + cos(3*x)/3
x1 <- seq(-2*pi,2*pi,length=100)
y1 <- sin(x1) + cos(x1) - .5*sin(2*x1) - .5*cos(2*x1) + sin(3*x1)/3 + cos(3*x1)/3

yout <- smooth12(x1,y1,x)
plot(x,y,type="l")
lines(x,yout,col="red")

x <- seq(0,10)
xmat <- expand.grid(x,x)
y <- sqrt((xmat[,1]-5)^2 + (xmat[,2]-5)^2)
xout <- cbind(runif(n,0,10),runif(n,0,10))
y1 <- sqrt((xout[,1]-5)^2 + (xout[,2]-5)^2)
y2 <- smooth12(xmat,y,xout)
cor(y1,y2)



