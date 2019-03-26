library(Sim.DiffProc)


### Name: bridgesde2d
### Title: Simulation of 2-D Bridge SDE's
### Aliases: bridgesde2d bridgesde2d.default print.bridgesde2d
###   time.bridgesde2d mean.bridgesde2d Median.bridgesde2d Mode.bridgesde2d
###   quantile.bridgesde2d kurtosis.bridgesde2d skewness.bridgesde2d
###   moment.bridgesde2d summary.bridgesde2d cv.bridgesde2d max.bridgesde2d
###   min.bridgesde2d bconfint.bridgesde2d plot.bridgesde2d
###   points.bridgesde2d lines.bridgesde2d plot2d.bridgesde2d
###   points2d.bridgesde2d lines2d.bridgesde2d
### Keywords: sde ts mts

### ** Examples

## dX(t) = 4*(-1-X(t)) dt + 0.2 dW1(t)
## dY(t) = X(t) dt + 0 dW2(t)
## x01 = 0 , y01 = 0
## x02 = 0, y02 = 0 
## W1(t) and W2(t) two independent Brownian motion
set.seed(1234)

fx <- expression(4*(-1-x) , x)
gx <- expression(0.2 , 0)
res <- bridgesde2d(drift=fx,diffusion=gx,Dt=0.005,M=500)
res
summary(res) ## Monte-Carlo statistics at time T/2=2.5
summary(res,at=1) ## Monte-Carlo statistics at time 1
summary(res,at=4) ## Monte-Carlo statistics at time 4
##
plot(res,type="n")
lines(time(res),apply(res$X,1,mean),col=3,lwd=2)
lines(time(res),apply(res$Y,1,mean),col=4,lwd=2)
legend("topright",c(expression(E(X[t])),expression(E(Y[t]))),lty=1,inset = .7,col=c(3,4))
##
plot2d(res)



