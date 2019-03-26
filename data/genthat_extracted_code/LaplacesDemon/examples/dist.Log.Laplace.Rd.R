library(LaplacesDemon)


### Name: dist.Log.Laplace
### Title: Log-Laplace Distribution: Univariate Symmetric
### Aliases: dllaplace pllaplace qllaplace rllaplace
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dllaplace(1,0,1)
x <- pllaplace(1,0,1)
x <- qllaplace(0.5,0,1)
x <- rllaplace(100,0,1)

#Plot Probability Functions
x <- seq(from=0.1, to=20, by=0.1)
plot(x, dllaplace(x,0,0.1), ylim=c(0,1), type="l", main="Probability Function",
     ylab="density", col="red")
lines(x, dllaplace(x,0,0.5), type="l", col="green")
lines(x, dllaplace(x,0,1.5), type="l", col="blue")
legend(2, 0.9, expression(paste(mu==0, ", ", lambda==0.1),
     paste(mu==0, ", ", lambda==0.5), paste(mu==0, ", ", lambda==1.5)),
     lty=c(1,1,1), col=c("red","green","blue"))



