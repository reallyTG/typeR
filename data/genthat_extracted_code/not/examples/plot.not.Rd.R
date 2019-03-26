library(not)


### Name: plot.not
### Title: Plot a 'not' object
### Aliases: plot.not

### ** Examples

# **** Piecewisce-constant mean with Gaussian noise.
x <- c(rep(0, 100), rep(1,100)) + rnorm(100)
# *** identify potential locations of the change-points
w <- not(x, contrast = "pcwsConstMean")
# *** when 'cpt' is omitted, 'features' function is used internally 
# to choose change-points locations
plot(w)
# *** estimate and plot the signal specifying the location of the change-point
plot(w, cpt=100)



