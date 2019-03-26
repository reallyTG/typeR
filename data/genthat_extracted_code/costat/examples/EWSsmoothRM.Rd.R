library(costat)


### Name: EWSsmoothRM
### Title: Perform running mean smoothing of an EWS object
### Aliases: EWSsmoothRM
### Keywords: smooth ts

### ** Examples

#
# Make dummy time series
#
x <- rnorm(128)
#
# Compute spectrum, but don't do smoothing
#
xews <- ewspec(x, WPsmooth=FALSE)$S
#
# Now smooth the spectrum using running mean smoothing with bandwidth of 5
#
ans <- EWSsmoothRM(xews, s=5)



