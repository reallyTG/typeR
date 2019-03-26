library(not)


### Name: logLik.not
### Title: Extract likelihood from a 'not' object
### Aliases: logLik.not

### ** Examples

#' # **** Piecewisce-constant mean with Gaussian noise.
x <- c(rep(0, 100), rep(1,100)) + rnorm(100)
# *** identify potential locations of the change-points
w <- not(x, contrast = "pcwsConstMean")
# *** log-likelihood for the model with the change-point estimated  via 'not'
logLik(w)
# *** log-likelihood for the model with the change-point at 100
logLik(w, cpt=100)



