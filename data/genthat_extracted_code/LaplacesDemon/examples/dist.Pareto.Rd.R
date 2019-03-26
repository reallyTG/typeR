library(LaplacesDemon)


### Name: dist.Pareto
### Title: Pareto Distribution
### Aliases: dpareto ppareto qpareto rpareto
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dpareto(1,1)
x <- ppareto(0.5,1)
x <- qpareto(0.5,1)
x <- rpareto(10,1)

#Plot Probability Functions
x <- seq(from=1, to=5, by=0.01)
plot(x, dpareto(x,0.1), ylim=c(0,1), type="l", main="Probability Function",
     ylab="density", col="red")
lines(x, dpareto(x,0.5), type="l", col="green")
lines(x, dpareto(x,1), type="l", col="blue")
legend(2, 0.9, expression(alpha==0.1, alpha==0.5, alpha==1),
     lty=c(1,1,1), col=c("red","green","blue"))



