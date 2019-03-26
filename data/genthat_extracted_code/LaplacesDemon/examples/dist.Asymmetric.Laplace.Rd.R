library(LaplacesDemon)


### Name: dist.Asymmetric.Laplace
### Title: Asymmetric Laplace Distribution: Univariate
### Aliases: dalaplace palaplace qalaplace ralaplace
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dalaplace(1,0,1,1)
x <- palaplace(1,0,1,1)
x <- qalaplace(0.5,0,1,1)
x <- ralaplace(100,0,1,1)

#Plot Probability Functions
x <- seq(from=-5, to=5, by=0.1)
plot(x, dalaplace(x,0,1,0.5), ylim=c(0,1), type="l", main="Probability Function",
     ylab="density", col="red")
lines(x, dalaplace(x,0,1,1), type="l", col="green")
lines(x, dalaplace(x,0,1,5), type="l", col="blue")
legend(1, 0.9, expression(paste(mu==0, ", ", lambda==1, ", ", kappa==0.5),
     paste(mu==0, ", ", lambda==1, ", ", kappa==1),
     paste(mu==0, ", ", lambda==1, ", ", kappa==5)),
     lty=c(1,1,1), col=c("red","green","blue"))



