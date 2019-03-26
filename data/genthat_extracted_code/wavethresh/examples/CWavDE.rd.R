library(wavethresh)


### Name: CWavDE
### Title: Simple wavelet density estimator with hard thresholding
### Aliases: CWavDE
### Keywords: smooth

### ** Examples

#
# Let's generate a bi-modal artificial set of data.
#
x <- c( rnorm(100), rnorm(100, 10))
#
# Now perform simple wavelet density estimate
#
wde <- CWavDE(x, Jmax=10, threshold=1)
#
# Plot results
#
## Not run: plot(wde$x, wde$y, type="l")



