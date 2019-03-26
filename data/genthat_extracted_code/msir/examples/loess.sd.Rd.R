library(msir)


### Name: loess.sd
### Title: Local Polynomial Regression Fitting with Variability bands
### Aliases: loess.sd panel.loess
### Keywords: loess

### ** Examples

data(cars)
plot(cars, main = "lowess.sd(cars)")
lines(l <- loess.sd(cars))
lines(l$x, l$upper, lty=2)
lines(l$x, l$lower, lty=2)



