library(Sim.DiffProc)


### Name: snssde3d
### Title: Simulation of 3-D Stochastic Differential Equation
### Aliases: snssde3d snssde3d.default summary.snssde3d print.snssde3d
###   time.snssde3d mean.snssde3d Median.snssde3d Mode.snssde3d
###   quantile.snssde3d kurtosis.snssde3d skewness.snssde3d moment.snssde3d
###   cv.snssde3d max.snssde3d min.snssde3d bconfint.snssde3d plot.snssde3d
###   points.snssde3d lines.snssde3d plot3D.snssde3d
### Keywords: sde ts mts

### ** Examples


## Example 1: Ito sde
## dX(t) = (2*(Y(t)>0)-2*(Z(t)<=0)) dt + 0.2 * dW1(t) 
## dY(t) = -2*Y(t) dt + 0.2 * dW2(t) 
## dZ(t) = -2*Z(t) dt + 0.2 * dW3(t)        
## W1(t), W2(t) and W3(t) three independent Brownian motion
set.seed(1234)

fx <- expression(2*(y>0)-2*(z<=0) , -2*y, -2*z)
gx <- rep(expression(0.2),3)

mod3d1 <- snssde3d(x0=c(0,2,-2),drift=fx,diffusion=gx,M=500,Dt=0.003)
mod3d1
summary(mod3d1)
##
dev.new()
plot(mod3d1,type="n")
mx <- apply(mod3d1$X,1,mean)
my <- apply(mod3d1$Y,1,mean)
mz <- apply(mod3d1$Z,1,mean)
lines(time(mod3d1),mx,col=1)
lines(time(mod3d1),my,col=2)
lines(time(mod3d1),mz,col=3)
legend("topright",c(expression(E(X[t])),expression(E(Y[t])),
 expression(E(Z[t]))),lty=1,inset = .01,col=c(1,2,3),cex=0.95)
##
dev.new()
plot3D(mod3d1,display="persp") ## in space (O,X,Y,Z)

## Example 2: Stratonovich sde
## dX(t) = Y(t)* dt           
## dY(t) = (4*( 1-X(t)^2 )* Y(t) - X(t))* dt + 0.2 o dW2(t)
## dZ(t) = (4*( 1-X(t)^2 )* Z(t) - X(t))* dt + 0.2 o dW3(t)
set.seed(1234)

fx <- expression( y , (4*( 1-x^2 )* y - x), (4*( 1-x^2 )* z - x))
gx <- expression( 0 , 0.2, 0.2)

mod3d2 <- snssde3d(drift=fx,diffusion=gx,N=10000,T=100,type="str")
mod3d2
##
dev.new()
plot(mod3d2,pos=2)
##
dev.new()
plot(mod3d2,union = FALSE)
##
dev.new()
plot3D(mod3d2,display="persp") ## in space (O,X,Y,Z)



