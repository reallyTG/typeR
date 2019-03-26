library(LaplacesDemon)


### Name: dist.Skew.Laplace
### Title: Skew-Laplace Distribution: Univariate
### Aliases: dslaplace pslaplace qslaplace rslaplace
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dslaplace(1,0,1,1)
x <- pslaplace(1,0,1,1)
x <- qslaplace(0.5,0,1,1)
x <- rslaplace(100,0,1,1)

#Plot Probability Functions
x <- seq(from=0.1, to=3, by=0.01)
plot(x, dslaplace(x,0,1,1), ylim=c(0,1), type="l", main="Probability Function",
     ylab="density", col="red")
lines(x, dslaplace(x,0,0.5,2), type="l", col="green")
lines(x, dslaplace(x,0,2,0.5), type="l", col="blue")
legend(1.5, 0.9, expression(paste(mu==0, ", ", alpha==1, ", ", beta==1),
     paste(mu==0, ", ", alpha==0.5, ", ", beta==2),
     paste(mu==0, ", ", alpha==2, ", ", beta==0.5)),
     lty=c(1,1,1), col=c("red","green","blue"))



