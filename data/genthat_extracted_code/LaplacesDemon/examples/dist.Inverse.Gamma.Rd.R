library(LaplacesDemon)


### Name: dist.Inverse.Gamma
### Title: Inverse Gamma Distribution
### Aliases: dinvgamma rinvgamma
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dinvgamma(4.3, 1.1)
x <- rinvgamma(10, 3.3)

#Plot Probability Functions
x <- seq(from=0.1, to=20, by=0.1)
plot(x, dinvgamma(x,1,1), ylim=c(0,1), type="l", main="Probability Function",
     ylab="density", col="red")
lines(x, dinvgamma(x,1,0.6), type="l", col="green")
lines(x, dinvgamma(x,0.6,1), type="l", col="blue")
legend(2, 0.9, expression(paste(alpha==1, ", ", beta==1),
     paste(alpha==1, ", ", beta==0.6), paste(alpha==0.6, ", ", beta==1)),
     lty=c(1,1,1), col=c("red","green","blue"))



