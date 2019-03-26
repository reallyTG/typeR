library(LaplacesDemon)


### Name: dist.Generalized.Poisson
### Title: Generalized Poisson Distribution
### Aliases: dgpois
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
y <- rpois(100, 5)
lambda <- rpois(100, 5)
x <- dgpois(y, lambda, 0.5)

#Plot Probability Functions
x <- seq(from=0, to=20, by=1)
plot(x, dgpois(x,1,0.5), ylim=c(0,1), type="l", main="Probability Function",
     ylab="density", col="red")
lines(x, dlaplace(x,1,0.6), type="l", col="green")
lines(x, dlaplace(x,1,0.7), type="l", col="blue")
legend(2, 0.9, expression(paste(lambda==1, ", ", omega==0.5),
     paste(lambda==1, ", ", omega==0.6), paste(lambda==1, ", ", omega==0.7)),
     lty=c(1,1,1), col=c("red","green","blue"))



