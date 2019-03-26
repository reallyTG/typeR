library(LaplacesDemon)


### Name: dist.Normal.Variance
### Title: Normal Distribution: Variance Parameterization
### Aliases: dnormv pnormv qnormv rnormv
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dnormv(1,0,1)
x <- pnormv(1,0,1)
x <- qnormv(0.5,0,1)
x <- rnormv(100,0,1)

#Plot Probability Functions
x <- seq(from=-5, to=5, by=0.1)
plot(x, dnormv(x,0,0.5), ylim=c(0,1), type="l", main="Probability Function",
     ylab="density", col="red")
lines(x, dnormv(x,0,1), type="l", col="green")
lines(x, dnormv(x,0,5), type="l", col="blue")
legend(2, 0.9, expression(paste(mu==0, ", ", sigma^2==0.5),
     paste(mu==0, ", ", sigma^2==1), paste(mu==0, ", ", sigma^2==5)),
     lty=c(1,1,1), col=c("red","green","blue"))



