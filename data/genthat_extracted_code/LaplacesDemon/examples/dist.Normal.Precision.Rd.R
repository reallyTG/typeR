library(LaplacesDemon)


### Name: dist.Normal.Precision
### Title: Normal Distribution: Precision Parameterization
### Aliases: dnormp pnormp qnormp rnormp
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dnormp(1,0,1)
x <- pnormp(1,0,1)
x <- qnormp(0.5,0,1)
x <- rnormp(100,0,1)

#Plot Probability Functions
x <- seq(from=-5, to=5, by=0.1)
plot(x, dnormp(x,0,0.5), ylim=c(0,1), type="l", main="Probability Function",
     ylab="density", col="red")
lines(x, dnormp(x,0,1), type="l", col="green")
lines(x, dnormp(x,0,5), type="l", col="blue")
legend(2, 0.9, expression(paste(mu==0, ", ", tau==0.5),
     paste(mu==0, ", ", tau==1), paste(mu==0, ", ", tau==5)),
     lty=c(1,1,1), col=c("red","green","blue"))



