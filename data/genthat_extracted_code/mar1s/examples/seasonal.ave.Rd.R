library(mar1s)


### Name: seasonal.ave
### Title: Averaged Seasonal Component of Time Series
### Aliases: seasonal.ave
### Keywords: ts

### ** Examples

set.seed(19860306)

## Artificial example
x <- ts(sin(2*pi*(3:97)/10) + 0.5*rnorm(length(3:97)),
	start = c(0, 3), frequency = 10)

plot.default(time(x)%%1, x, xlab = "Phase")
lines(seasonal.ave(x), col = "blue")
lines(seasonal.ave(x, median), col = "green")
legend("bottomleft",
       legend = c("Mean averaging",
		  "Median averaging"),
       col = c("blue", "green"),
       lty = "solid")

## Realistic example
data(nesterov.index, package = "mar1s")
x <- log(nesterov.index[, "mean"])
x[x < -10] <- -Inf

plot.default(time(x)%%1, x, xlab = "Phase", pch = ".")
lines(seasonal.ave(x), col = "blue")
lines(seasonal.ave(x, median), col = "green")
legend("topleft",
       legend = c("Mean averaging",
		  "Median averaging"),
       col = c("blue", "green"),
       lty = "solid")



