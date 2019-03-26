library(Sim.DiffProc)


### Name: bridgesde3d
### Title: Simulation of 3-D Bridge SDE's
### Aliases: bridgesde3d bridgesde3d.default print.bridgesde3d
###   time.bridgesde3d mean.bridgesde3d Median.bridgesde3d Mode.bridgesde3d
###   quantile.bridgesde3d kurtosis.bridgesde3d skewness.bridgesde3d
###   moment.bridgesde3d summary.bridgesde3d cv.bridgesde3d max.bridgesde3d
###   min.bridgesde3d bconfint.bridgesde3d plot.bridgesde3d
###   points.bridgesde3d lines.bridgesde3d plot3D.bridgesde3d
### Keywords: sde ts mts

### ** Examples

## dX(t) = 4*(-1-X(t))*Y(t) dt + 0.2 * dW1(t) ; x01 = 0 and y01 = 0
## dY(t) = 4*(1-Y(t)) *X(t) dt + 0.2 * dW2(t) ; x02 = -1 and y02 = -2
## dZ(t) = 4*(1-Z(t)) *Y(t) dt + 0.2 * dW3(t) ; x03 = 0.5 and y03 = 0.5       
## W1(t), W2(t) and W3(t) three independent Brownian motion
set.seed(1234)

fx <- expression(4*(-1-x)*y, 4*(1-y)*x, 4*(1-z)*y)
gx <- rep(expression(0.2),3)

res <- bridgesde3d(x0=c(0,-1,0.5),y=c(0,-2,0.5),drift=fx,diffusion=gx,M=200)
res
summary(res) ## Monte-Carlo statistics at time T/2=0.5
summary(res,at=0.25) ## Monte-Carlo statistics at time 0.25
summary(res,at=0.75) ## Monte-Carlo statistics at time 0.75
##
plot(res,type="n")
lines(time(res),apply(res$X,1,mean),col=3,lwd=2)
lines(time(res),apply(res$Y,1,mean),col=4,lwd=2)
lines(time(res),apply(res$Z,1,mean),col=5,lwd=2)
legend("topleft",c(expression(E(X[t])),expression(E(Y[t])),
       expression(E(Z[t]))),lty=1,inset = .01,col=c(3,4,5))
##
plot3D(res,display = "persp",main="3-dim bridge sde")



