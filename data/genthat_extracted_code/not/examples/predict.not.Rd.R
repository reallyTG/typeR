library(not)


### Name: predict.not
### Title: Estimate signal for a 'not' object.
### Aliases: predict.not

### ** Examples

# **** Piecewisce-constant mean with Gaussian noise.
x <- c(rep(0, 100), rep(1,100)) + rnorm(100)
# *** identify potential locations of the change-points
w <- not(x, contrast = "pcwsConstMean")
# *** when 'cpt' is omitted, 'features' function is used internally 
# to choose change-points locations
signal.est <- predict(w)
# *** estimate the signal specifying the location of the change-point
signal.est.known.cpt <- predict(w, cpt=100)
# *** pass arguments of the 'features' function through 'predict'.
signal.est.aic <- predict(w, penalty.type="aic")

# **** Piecewisce-constant mean and variance with Gaussian noise.
x <- c(rep(0, 100), rep(1,100)) + c(rep(2, 100), rep(1,100)) * rnorm(100)
# *** identify potential locations of the change-points
w <- not(x, contrast = "pcwsConstMeanVar")
# *** here signal is two-dimensional
signal.est <- predict(w)



