library(not)


### Name: features
### Title: Extract locations of features from a 'not' object
### Aliases: features features.default

### ** Examples

# **** Piecewisce-constant mean with Gaussian noise.
x <- c(rep(0, 100), rep(1,100)) + rnorm(100)
# *** identify potential locations of the change-points
w <- not(x, contrast = "pcwsConstMean")
# *** choose change-points using default settings
fo <- features(w)
# *** get the change-points
fo$cpt
# *** plot the SIC curve
plot(fo$ic)



