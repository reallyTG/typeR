library(LaplacesDemon)


### Name: dist.Asymmetric.Log.Laplace
### Title: Asymmetric Log-Laplace Distribution
### Aliases: dallaplace pallaplace qallaplace rallaplace
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dallaplace(1,0,1,1)
x <- pallaplace(1,0,1,1)
x <- qallaplace(0.5,0,1,1)
x <- rallaplace(100,0,1,1)

#Plot Probability Functions
x <- seq(from=0.1, to=10, by=0.1)
plot(x, dallaplace(x,0,1,0.5), ylim=c(0,1), type="l", main="Probability Function",
     ylab="density", col="red")
lines(x, dallaplace(x,0,1,1), type="l", col="green")
lines(x, dallaplace(x,0,1,5), type="l", col="blue")
legend(5, 0.9, expression(paste(mu==0, ", ", lambda==1, ", ", kappa==0.5),
     paste(mu==0, ", ", lambda==1, ", ", kappa==1),
     paste(mu==0, ", ", lambda==1, ", ", kappa==5)),
     lty=c(1,1,1), col=c("red","green","blue"))



