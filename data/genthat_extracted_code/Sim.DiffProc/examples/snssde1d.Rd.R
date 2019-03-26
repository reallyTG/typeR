library(Sim.DiffProc)


### Name: snssde1d
### Title: Simulation of 1-D Stochastic Differential Equation
### Aliases: snssde1d snssde1d.default summary.snssde1d print.snssde1d
###   time.snssde1d mean.snssde1d Median.snssde1d Mode.snssde1d
###   quantile.snssde1d kurtosis.snssde1d skewness.snssde1d moment.snssde1d
###   cv.snssde1d max.snssde1d min.snssde1d bconfint.snssde1d plot.snssde1d
###   points.snssde1d lines.snssde1d
### Keywords: sde ts mts

### ** Examples


## Example 1: Ito sde
## dX(t) = 2*(3-X(t)) dt + 2*X(t) dW(t)
set.seed(1234)

f <- expression(2*(3-x) )
g <- expression(1)
mod1 <- snssde1d(drift=f,diffusion=g,M=4000,x0=10,Dt=0.01)
mod1
summary(mod1)
## Not run: 
##D plot(mod1)
##D lines(time(mod1),apply(mod1$X,1,mean),col=2,lwd=2)
##D lines(time(mod1),apply(mod1$X,1,bconfint,level=0.95)[1,],col=4,lwd=2)
##D lines(time(mod1),apply(mod1$X,1,bconfint,level=0.95)[2,],col=4,lwd=2)
##D legend("topright",c("mean path",paste("bound of", 95," percent confidence")),
##D        inset = .01,col=c(2,4),lwd=2,cex=0.8)
## End(Not run)
## Example 2: Stratonovich sde
## dX(t) = ((2-X(t))/(2-t)) dt + X(t) o dW(t)
set.seed(1234)

f <- expression((2-x)/(2-t))
g <- expression(x)
mod2 <- snssde1d(type="str",drift=f,diffusion=g,M=4000,x0=1, method="milstein")
mod2
summary(mod2,at = 0.25)
summary(mod2,at = 1)
## Not run: 
##D plot(mod2)
##D lines(time(mod2),apply(mod2$X,1,mean),col=2,lwd=2)
##D lines(time(mod2),apply(mod2$X,1,bconfint,level=0.95)[1,],col=4,lwd=2)
##D lines(time(mod2),apply(mod2$X,1,bconfint,level=0.95)[2,],col=4,lwd=2)
##D legend("topleft",c("mean path",paste("bound of", 95," percent confidence")),
##D        inset = .01,col=c(2,4),lwd=2,cex=0.8)
## End(Not run)



