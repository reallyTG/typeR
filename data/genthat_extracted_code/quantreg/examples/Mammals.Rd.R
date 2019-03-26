library(quantreg)


### Name: Mammals
### Title: Garland(1983) Data on Running Speed of Mammals
### Aliases: Mammals
### Keywords: datasets

### ** Examples

data(Mammals)
attach(Mammals)
x <- log(weight)
y <- log(speed)
plot(x,y, xlab="Weight in log(Kg)", ylab="Speed in log(Km/hour)",type="n")
points(x[hoppers],y[hoppers],pch = "h", col="red")
points(x[specials],y[specials],pch = "s", col="blue")
others <- (!hoppers & !specials)
points(x[others],y[others], col="black",cex = .75)
fit <- rqss(y ~ qss(x, lambda = 1),tau = .9)
plot(fit)



