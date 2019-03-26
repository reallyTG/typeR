library(biwavelet)


### Name: biwavelet-package
### Title: Conduct Univariate and Bivariate Wavelet Analyses
### Aliases: biwavelet-package biwavelet
### Keywords: coherence cross-wavelet wavelet

### ** Examples

# As of biwavelet version 0.14, the bias-corrected wavelet and cross-wavelet spectra
# are automatically computed and plotted by default using the methods
# described by Liu et al. (2007) and Veleda et al. (2012). This correction
# is needed because the traditional approach for computing the power spectrum
# (e.g., Torrence and Compo 1998) leads to an artificial and systematic reduction
# in power at low periods.

# EXAMPLE OF BIAS CORRECTION:
require(biwavelet)
# Generate a synthetic time series 's' with the same power at three distinct periods
t1=sin(seq(from=0, to=2*5*pi, length=1000))
t2=sin(seq(from=0, to=2*15*pi, length=1000))
t3=sin(seq(from=0, to=2*40*pi, length=1000))
s=t1+t2+t3

# Compare non-corrected vs. corrected wavelet spectrum
wt1=wt(cbind(1:1000, s))
par(mfrow=c(1,2))
plot(wt1, type="power.corr.norm", main="Bias-corrected")
plot(wt1, type="power.norm", main="Not-corrected")

# ADDITIONAL EXAMPLES
t1 <- cbind(1:100, rnorm(100))
t2 <- cbind(1:100, rnorm(100))

# Continuous wavelet transform
wt.t1 <- wt(t1)

# Plot power
# Make room to the right for the color bar
par(oma = c(0, 0, 0, 1), mar = c(5, 4, 4, 5) + 0.1)
plot(wt.t1, plot.cb=TRUE, plot.phase=FALSE)

# Compute cross-wavelet
xwt.t1t2 <- xwt(t1, t2)

# Plot cross wavelet power and phase difference (arrows)
plot(xwt.t1t2, plot.cb=TRUE)

# Wavelet coherence; nrands should be large (>= 1000)
wtc.t1t2=wtc(t1, t2, nrands=10)
# Plot wavelet coherence and phase difference (arrows)
# Make room to the right for the color bar
par(oma=c(0, 0, 0, 1), mar=c(5, 4, 4, 5) + 0.1)
plot(wtc.t1t2, plot.cb=TRUE)

# Perform wavelet clustering of three time series
t1=cbind(1:100, sin(seq(from=0, to=10*2*pi, length.out=100)))
t2=cbind(1:100, sin(seq(from=0, to=10*2*pi, length.out=100)+0.1*pi))
t3=cbind(1:100, rnorm(100))

# Compute wavelet spectra
wt.t1=wt(t1)
wt.t2=wt(t2)
wt.t3=wt(t3)

# Store all wavelet spectra into array
w.arr=array(NA, dim=c(3, NROW(wt.t1$wave), NCOL(wt.t1$wave)))
w.arr[1, , ]=wt.t1$wave
w.arr[2, , ]=wt.t2$wave
w.arr[3, , ]=wt.t3$wave

# Compute dissimilarity and distance matrices
w.arr.dis <- wclust(w.arr)
plot(hclust(w.arr.dis$dist.mat, method = "ward.D"), sub = "", main = "",
     ylab = "Dissimilarity", hang = -1)



