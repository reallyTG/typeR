library(Sim.DiffProc)


### Name: snssde2d
### Title: Simulation of 2-D Stochastic Differential Equation
### Aliases: snssde2d snssde2d.default summary.snssde2d print.snssde2d
###   time.snssde2d mean.snssde2d Median.snssde2d Mode.snssde2d
###   quantile.snssde2d kurtosis.snssde2d skewness.snssde2d moment.snssde2d
###   cv.snssde2d max.snssde2d min.snssde2d bconfint.snssde2d plot.snssde2d
###   points.snssde2d lines.snssde2d plot2d.snssde2d points2d.snssde2d
###   lines2d.snssde2d
### Keywords: sde ts mts

### ** Examples


## Example 1: Ito sde
## dX(t) = 4*(-1-X(t))*Y(t) dt + 0.2 dW1(t)
## dY(t) = 4*(1-Y(t))*X(t) dt + 0.2 dW2(t)
set.seed(1234)

fx <- expression(4*(-1-x)*y , 4*(1-y)*x )
gx <- expression(0.25*y,0.2*x)

mod2d1 <- snssde2d(drift=fx,diffusion=gx,x0=c(x0=1,y0=-1),M=1000)
mod2d1
summary(mod2d1)
##
dev.new()
plot(mod2d1,type="n")
mx <- apply(mod2d1$X,1,mean)
my <- apply(mod2d1$Y,1,mean)
lines(time(mod2d1),mx,col=1)
lines(time(mod2d1),my,col=2)
legend("topright",c(expression(E(X[t])),expression(E(Y[t]))),lty=1,inset = .01,col=c(1,2),cex=0.95)
##
dev.new()
plot2d(mod2d1) ## in plane (O,X,Y)
lines(my~mx,col=2)



## Example 2: Stratonovich sde
## dX(t) = Y(t) dt + 0 o dW1(t)
## dY(t) = (4*(1-X(t)^2)*Y(t) - X(t) ) dt + 0.2 o dW2(t)
set.seed(1234)

fx <- expression( y , (4*( 1-x^2 )* y - x))
gx <- expression( 0 , 0.2)

mod2d2 <- snssde2d(drift=fx,diffusion=gx,type="str",T=100,N=10000)
mod2d2
plot(mod2d2,pos=2)
dev.new()
plot(mod2d2,union = FALSE)
dev.new()
plot2d(mod2d2,type="n") ## in plane (O,X,Y)
points2d(mod2d2,col=rgb(0,100,0,50,maxColorValue=255), pch=16)



