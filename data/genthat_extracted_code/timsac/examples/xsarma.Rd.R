library(timsac)


### Name: xsarma
### Title: Exact Maximum Likelihood Method of Scalar ARMA Model Fitting
### Aliases: xsarma
### Keywords: ts

### ** Examples

# "arima.sim" is a function in "stats".
# Note that the sign of MA coefficient is opposite from that in "timsac".
arcoef <- c(1.45, -0.9)
macoef <- c(-0.5)
y <- arima.sim(list(order=c(2,0,1), ar=arcoef, ma=macoef), n = 100)
arcoefi <- c(1.5, -0.8)
macoefi <- c(0.0)
z <- xsarma(y, arcoefi, macoefi)
z$arcoef
z$macoef



