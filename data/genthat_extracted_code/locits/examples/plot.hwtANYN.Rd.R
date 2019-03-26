library(locits)


### Name: plot.hwtANYN
### Title: Plots the transform contained in an 'hwtANYN' object.
### Aliases: plot.hwtANYN
### Keywords: hplot smooth

### ** Examples

#
# Generate test data of length 82
#
v3 <- rnorm(82)
#
# Compute Haar wavelet transform, note reindex has to be true for subsequent
# plot.
#
v3.hwt <- hwt(v3, reindex=TRUE)
#
#
## Not run: plot(v3.hwt)



