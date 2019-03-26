library(LaplacesDemon)


### Name: dist.HalfCauchy
### Title: Half-Cauchy Distribution
### Aliases: dhalfcauchy phalfcauchy qhalfcauchy rhalfcauchy
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dhalfcauchy(1,25)
x <- phalfcauchy(1,25)
x <- qhalfcauchy(0.5,25)
x <- rhalfcauchy(1,25)

#Plot Probability Functions
x <- seq(from=0, to=20, by=0.1)
plot(x, dhalfcauchy(x,1), ylim=c(0,1), type="l", main="Probability Function",
     ylab="density", col="red")
lines(x, dhalfcauchy(x,5), type="l", col="green")
lines(x, dhalfcauchy(x,10), type="l", col="blue")
legend(2, 0.9, expression(alpha==1, alpha==5, alpha==10),
     lty=c(1,1,1), col=c("red","green","blue"))



