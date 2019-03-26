library(LaplacesDemon)


### Name: dist.Inverse.Beta
### Title: Inverse Beta Distribution
### Aliases: dinvbeta rinvbeta
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dinvbeta(5:10, 2, 3)
x <- rinvbeta(10, 2, 3)

#Plot Probability Functions
x <- seq(from=0.1, to=20, by=0.1)
plot(x, dinvbeta(x,2,2), ylim=c(0,1), type="l", main="Probability Function",
     ylab="density", col="red")
lines(x, dinvbeta(x,2,3), type="l", col="green")
lines(x, dinvbeta(x,3,2), type="l", col="blue")
legend(2, 0.9, expression(paste(alpha==2, ", ", beta==2),
     paste(alpha==2, ", ", beta==3), paste(alpha==3, ", ", beta==2)),
     lty=c(1,1,1), col=c("red","green","blue"))



