library(rwt)


### Name: denoise
### Title: Wavelet-based Denoising
### Aliases: denoise denoise.dwt denoise.udwt DWT.TRANSFORM.TYPE
###   UDWT.TRANSFORM.TYPE MAD.VARIANCE.ESTIMATOR STD.VARIANCE.ESTIMATOR
###   SOFT.THRESHOLD.TYPE HARD.THRESHOLD.TYPE MAX.DECOMPOSITION
###   CALC.THRESHOLD.TO.USE DEFAULT.DWT.THRESHOLD.MULTIPLIER
###   DEFAULT.UDWT.THRESHOLD.MULTIPLIER default.dwt.option
###   default.udwt.option
### Keywords: interface

### ** Examples

sig <- makesig(SIGNAL.DOPPLER)
h <- daubcqf(6)
ret.dwt <- denoise.dwt(sig$x, h$h.0)



