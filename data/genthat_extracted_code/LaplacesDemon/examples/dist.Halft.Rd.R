library(LaplacesDemon)


### Name: dist.Halft
### Title: Half-t Distribution
### Aliases: dhalft phalft qhalft rhalft
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dhalft(1,25,1)
x <- phalft(1,25,1)
x <- qhalft(0.5,25,1)
x <- rhalft(10,25,1)

#Plot Probability Functions
x <- seq(from=0.1, to=20, by=0.1)
plot(x, dhalft(x,1,-1), ylim=c(0,1), type="l", main="Probability Function",
     ylab="density", col="red")
lines(x, dhalft(x,1,0.5), type="l", col="green")
lines(x, dhalft(x,1,500), type="l", col="blue")
legend(2, 0.9, expression(paste(alpha==1, ", ", nu==-1),
     paste(alpha==1, ", ", nu==0.5), paste(alpha==1, ", ", nu==500)),
     lty=c(1,1,1), col=c("red","green","blue"))



