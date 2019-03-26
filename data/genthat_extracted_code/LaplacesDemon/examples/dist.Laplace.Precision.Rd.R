library(LaplacesDemon)


### Name: dist.Laplace.Precision
### Title: Laplace Distribution: Precision Parameterization
### Aliases: dlaplacep plaplacep qlaplacep rlaplacep
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dlaplacep(1,0,1)
x <- plaplacep(1,0,1)
x <- qlaplacep(0.5,0,1)
x <- rlaplacep(100,0,1)

#Plot Probability Functions
x <- seq(from=-5, to=5, by=0.1)
plot(x, dlaplacep(x,0,0.5), ylim=c(0,1), type="l", main="Probability Function",
     ylab="density", col="red")
lines(x, dlaplacep(x,0,1), type="l", col="green")
lines(x, dlaplacep(x,0,2), type="l", col="blue")
legend(2, 0.9, expression(paste(mu==0, ", ", tau==0.5),
     paste(mu==0, ", ", tau==1), paste(mu==0, ", ", tau==2)),
     lty=c(1,1,1), col=c("red","green","blue"))



