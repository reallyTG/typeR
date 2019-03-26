library(wavethresh)


### Name: LocalSpec.wd
### Title: Compute Nason and Silverman raw or smoothed wavelet periodogram.
### Aliases: LocalSpec.wd
### Keywords: smooth

### ** Examples

#
# This function is obsolete. See ewspec()
#
# Compute the raw periodogram of the BabyECG
# data using the Daubechies least-asymmetric wavelet $N=10$.
#
data(BabyECG)
babywdS <- wd(BabyECG, filter.number=10, family="DaubLeAsymm", type="station")
babyWP <- LocalSpec(babywdS, lsmooth = "none", nlsmooth = FALSE)
## Not run: plot(babyWP, main="Raw Wavelet Periodogram of Baby ECG")
#
# Note that the lower levels of this plot are too large. This is partly because
# there are "too many" coefficients at the lower levels. For a better
# picture of the local spectral properties of this time series see
# the examples section of ewspec
#
# Other results of this function can be seen in the paper by
# Nason and Silverman (1995) above.
#



