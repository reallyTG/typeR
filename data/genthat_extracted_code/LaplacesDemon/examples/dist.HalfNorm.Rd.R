library(LaplacesDemon)


### Name: dist.HalfNormal
### Title: Half-Normal Distribution
### Aliases: dhalfnorm phalfnorm qhalfnorm rhalfnorm
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dhalfnorm(1)
x <- phalfnorm(1)
x <- qhalfnorm(0.5)
x <- rhalfnorm(10)

#Plot Probability Functions
x <- seq(from=0.1, to=20, by=0.1)
plot(x, dhalfnorm(x,0.1), ylim=c(0,1), type="l", main="Probability Function",
     ylab="density", col="red")
lines(x, dhalfnorm(x,0.5), type="l", col="green")
lines(x, dhalfnorm(x,1), type="l", col="blue")
legend(2, 0.9, expression(sigma==0.1, sigma==0.5, sigma==1),
     lty=c(1,1,1), col=c("red","green","blue"))



