library(LaplacesDemon)


### Name: dist.Log.Normal.Precision
### Title: Log-Normal Distribution: Precision Parameterization
### Aliases: dlnormp plnormp qlnormp rlnormp
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dlnormp(1,0,1)
x <- plnormp(1,0,1)
x <- qlnormp(0.5,0,1)
x <- rlnormp(100,0,1)

#Plot Probability Functions
x <- seq(from=0.1, to=3, by=0.01)
plot(x, dlnormp(x,0,0.1), ylim=c(0,1), type="l", main="Probability Function",
     ylab="density", col="red")
lines(x, dlnormp(x,0,1), type="l", col="green")
lines(x, dlnormp(x,0,5), type="l", col="blue")
legend(2, 0.9, expression(paste(mu==0, ", ", tau==0.1),
     paste(mu==0, ", ", tau==1), paste(mu==0, ", ", tau==5)),
     lty=c(1,1,1), col=c("red","green","blue"))



