library(IDPmisc)


### Name: rfbaseline
### Title: Robust Fitting of Baselines
### Aliases: rfbaseline
### Keywords: robust regression smooth

### ** Examples

data(MS)
MS1 <- log10(MS[MS$mz>12000&MS$mz<1e5,])

MS1.rfb2 <- rfbaseline(x=MS1$mz, y=MS1$I, NoXP=2200, maxit=c(5,0))
plot(x=MS1$mz, y=MS1$I, type="l",
     xlab="log(mass/charge)", ylab="log(intensity)")
lines(MS1.rfb2$x, MS1.rfb2$fit, col="orange", lwd=3)

MS1.rfb3 <- rfbaseline(x=MS1$mz, y=MS1$I, NoXP=1100, maxit=c(5,0),
                       DOT=TRUE, Scale=function(x) mad(x, center=0))
plot(x=MS1$mz, y=MS1$I, type="l",
     xlab="log(mass/charge)", ylab="log(intensity)")
lines(MS1.rfb3$x, MS1.rfb3$fit, col="orange", lwd=3)

## 'delta=0' needs much more computer time
## Not run: 
##D MS1.rfb4 <- rfbaseline(x=MS1$mz, y=MS1$I, NoXP=2200,
##D                        delta=0, maxit=c(5,0))
##D plot(x=MS1$mz, y=MS1$I,ty="l",
##D      xlab="log(mass/charge)", ylab="log(intensity)")
##D lines(MS1.rfb4$x, MS1.rfb4$fit, col="orange", lwd=3)
## End(Not run)



