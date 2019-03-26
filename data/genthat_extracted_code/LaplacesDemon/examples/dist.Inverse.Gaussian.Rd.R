library(LaplacesDemon)


### Name: dist.Inverse.Gaussian
### Title: Inverse Gaussian Distribution
### Aliases: dinvgaussian rinvgaussian
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dinvgaussian(2, 1, 1)
x <- rinvgaussian(10, 1, 1)

#Plot Probability Functions
x <- seq(from=1, to=20, by=0.1)
plot(x, dinvgaussian(x,1,0.5), ylim=c(0,1), type="l", main="Probability Function",
     ylab="density", col="red")
lines(x, dinvgaussian(x,1,1), type="l", col="green")
lines(x, dinvgaussian(x,1,5), type="l", col="blue")
legend(2, 0.9, expression(paste(mu==1, ", ", sigma==0.5),
     paste(mu==1, ", ", sigma==1), paste(mu==1, ", ", sigma==5)),
     lty=c(1,1,1), col=c("red","green","blue"))



