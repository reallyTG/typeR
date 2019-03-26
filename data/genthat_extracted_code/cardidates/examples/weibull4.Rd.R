library(cardidates)


### Name: weibull4
### Title: Four-Parametric Weibull Function
### Aliases: weibull4 fweibull4 aweibull4
### Keywords: math arith

### ** Examples

x <- seq(0, 5, 0.02)
plot(x, fweibull4(x, c(0, 1, 2, 1)), type = "l", ylim = c(0, 2))
points(x, dweibull(x, 2, 1), pch = "+") ## identical to former

## shape
lines(x, fweibull4(x, c(0, 2, 1.5, 1)), type = "l", col = "orange")
## horizontal scaling
lines(x, fweibull4(x, c(0, 2, 2, 2)), type = "l", col = "green")
## shifting
lines(x, fweibull4(x, c(1, 1, 2, 1)), type = "l", col = "blue")
## vertical scaling
lines(x, fweibull4(x, c(0, 2, 2, 1)), type = "l", col = "red")


## definite integral
p <- c(0, 1, 2, 2)
plot(x, aweibull4(p, lower = 0, upper = x))

p <- c(0.1, 1, 2, 2)
plot(x, aweibull4(p, lower = 0, upper = x))



