library(spectral)


### Name: waterfall
### Title: Estimate the local frequencies
### Aliases: waterfall

### ** Examples

## noisy signal with amplitude modulation
x <- seq(0,1, length.out=1000)
# original data
# extended example from envelope function
y <- 2*(abs(x-0.5))*sin(10*2*pi*x) + ifelse(x > 0.5,sin(10*(1+2*(x - 0.5))*2*pi*x),0)
ye <- base::Re(envelope(y))

par(mfrow=c(2,1),mar=c(1,3.5,3,3),mgp=c(2.5,1,0))
# plot results
plot(x,y,type="l",lwd=1,col="darkgrey",lty=2,ylab="y",main="Original Data",xaxt="n",xlab="")
lines(x,ye)
legend("bottomright",c("modulated","envelope"),col=c("grey","black"),lty=c(2,1))

par(mar=c(3.5,3.5,2,0))
wf <- waterfall(y,x,nf = 3)
plot(wf,ylim=c(0,40),main="Waterfall")


## uncertainty principle
#
# take a look at the side effects at [0,30] and [1,0]
#
# with a large steepness e.g. n=50 you will gain
# artefacts.
#
x <- seq(0,1, length.out=500)
y <- sin(100*x*x)

par(mfrow=c(2,1),mar=c(1,3.5,3,3),mgp=c(2.5,1,0))
# plot results
plot(x,y,type="l",lwd=1,col="darkgrey",lty=2,ylab="y",main="Original Data",xaxt="n",xlab="")

par(mar=c(3.5,3.5,2,0))
wf <- waterfall(y,x)
rasterImage2(x = wf$x, y= wf$fx,z=wf$A,ylim=c(0,40),main="Waterfall")




