library(LaplacesDemon)


### Name: dist.Student.t.Precision
### Title: Student t Distribution: Precision Parameterization
### Aliases: dstp pstp qstp rstp
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dstp(1,0,1,10)
x <- pstp(1,0,1,10)
x <- qstp(0.5,0,1,10)
x <- rstp(100,0,1,10)

#Plot Probability Functions
x <- seq(from=-5, to=5, by=0.1)
plot(x, dstp(x,0,1,0.1), ylim=c(0,1), type="l", main="Probability Function",
     ylab="density", col="red")
lines(x, dstp(x,0,1,1), type="l", col="green")
lines(x, dstp(x,0,1,10), type="l", col="blue")
legend(1, 0.9, expression(paste(mu==0, ", ", tau==1, ", ", nu==0.5),
     paste(mu==0, ", ", tau==1, ", ", nu==1),
     paste(mu==0, ", ", tau==1, ", ", nu==10)),
     lty=c(1,1,1), col=c("red","green","blue"))



