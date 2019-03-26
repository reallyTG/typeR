library(Sim.DiffProc)


### Name: bridgesde1d
### Title: Simulation of 1-D Bridge SDE
### Aliases: bridgesde1d bridgesde1d.default print.bridgesde1d
###   time.bridgesde1d mean.bridgesde1d summary.bridgesde1d
###   Median.bridgesde1d Mode.bridgesde1d quantile.bridgesde1d
###   kurtosis.bridgesde1d skewness.bridgesde1d moment.bridgesde1d
###   cv.bridgesde1d max.bridgesde1d min.bridgesde1d bconfint.bridgesde1d
###   plot.bridgesde1d points.bridgesde1d lines.bridgesde1d
### Keywords: sde ts mts

### ** Examples

## Example 1: Ito bridge sde
## Ito Bridge sde
## dX(t) = 2*(1-X(t)) *dt + dW(t)
## x0 = 2 at time t0=0 , and y = 1 at time T=1
set.seed(1234)

f <- expression( 2*(1-x) )
g <- expression( 1 )
mod1 <- bridgesde1d(drift=f,diffusion=g,x0=2,y=1,M=1000)
mod1
summary(mod1) ## Monte-Carlo statistics at T/2=0.5
summary(mod1,at=0.75) ## Monte-Carlo statistics at 0.75
## Not run: 
##D plot(mod1)
##D lines(time(mod1),apply(mod1$X,1,mean),col=2,lwd=2)
##D lines(time(mod1),apply(mod1$X,1,bconfint,level=0.95)[1,],col=4,lwd=2)
##D lines(time(mod1),apply(mod1$X,1,bconfint,level=0.95)[2,],col=4,lwd=2)
##D legend("topleft",c("mean path",paste("bound of", 95," percent confidence")),
##D        inset = .01,col=c(2,4),lwd=2,cex=0.8)
## End(Not run)

## Example 2: Stratonovich sde
## dX(t) = ((2-X(t))/(2-t)) dt + X(t) o dW(t)
## x0 = 2 at time t0=0 , and y = 2 at time T=1
set.seed(1234)

f <- expression((2-x)/(2-t))
g <- expression(x)
mod2 <- bridgesde1d(type="str",drift=f,diffusion=g,M=1000,x0=2,y=2)
mod2
summary(mod2,at = 0.25) ## Monte-Carlo statistics at 0.25
summary(mod2,at = 0.5)  ## Monte-Carlo statistics at 0.5
summary(mod2,at = 0.75 )## Monte-Carlo statistics at 0.75
## Not run: 
##D plot(mod2)
##D lines(time(mod2),apply(mod2$X,1,mean),col=2,lwd=2)
##D lines(time(mod2),apply(mod2$X,1,bconfint,level=0.95)[1,],col=4,lwd=2)
##D lines(time(mod2),apply(mod2$X,1,bconfint,level=0.95)[2,],col=4,lwd=2)
##D legend("topright",c("mean path",paste("bound of", 95," percent confidence")),
##D        inset = .01,col=c(2,4),lwd=2,cex=0.8)
## End(Not run)



