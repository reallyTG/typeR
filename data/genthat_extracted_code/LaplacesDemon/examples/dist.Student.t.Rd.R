library(LaplacesDemon)


### Name: dist.Student.t
### Title: Student t Distribution: Univariate
### Aliases: dst pst qst rst
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dst(1,0,1,10)
x <- pst(1,0,1,10)
x <- qst(0.5,0,1,10)
x <- rst(100,0,1,10)

#Plot Probability Functions
x <- seq(from=-5, to=5, by=0.1)
plot(x, dst(x,0,1,0.1), ylim=c(0,1), type="l", main="Probability Function",
     ylab="density", col="red")
lines(x, dst(x,0,1,1), type="l", col="green")
lines(x, dst(x,0,1,10), type="l", col="blue")
legend(1, 0.9, expression(paste(mu==0, ", ", sigma==1, ", ", nu==0.5),
     paste(mu==0, ", ", sigma==1, ", ", nu==1),
     paste(mu==0, ", ", sigma==1, ", ", nu==10)),
     lty=c(1,1,1), col=c("red","green","blue"))



