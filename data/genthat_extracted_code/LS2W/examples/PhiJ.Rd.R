library(LS2W)


### Name: PhiJ
### Title: Compute discrete autocorrelation scaling function.
### Aliases: PhiJ
### Keywords: models

### ** Examples

#
# Let us create the discrete autocorrelation wavelets for the Haar wavelet.
# We shall create up to scale 4.
#
haardw4<- PhiJ(-4, filter.number=1, family="DaubExPhase")
haardw4
#[[1]]:
#[1] 0.5  1.0 0.5
#
#[[2]]:
#[1] 0.25 0.50  0.75  1.00  0.75 0.50 0.25
#
#[[3]]:
# [1] 0.125 0.250 0.375 0.500 0.625  0.750  0.875  1.000  0.875  0.750
#[11] 0.625 0.500 0.375 0.250 0.125
#
#[[4]]:
# [1] 0.0625 0.1250 0.1875 0.2500 0.3125 0.3750 0.4375 0.5000 0.5625
#[10] 0.6250  0.6875  0.7500  0.8125  0.8750  0.9375  1.0000  0.9375  0.8750
#[19]  0.8125  0.7500  0.6875 0.6250 0.5625 0.5000 0.4375 0.3750 0.3125
#[28] 0.2500 0.1875 0.1250 0.0625
#
# You can plot the fourth component to get an idea of what the
# autocorrelation wavelet looks like.
#
# Note that the previous call stores the autocorrelation wavelet
# in D1.Phi.4.1.DaubExPhase in the environment DWEnv. This is mainly so that 
# it doesn't have to be recomputed. 
#
# Note that the x-coordinates in the following are approximate.
#
 plot(seq(from=-1, to=1, length=length(haardw4[[4]])),haardw4[[4]], type="l",
xlab = "t", ylab = "Haar Autocorrelation Scaling function")



