library(BootWPTOS)


### Name: BootWPTOS
### Title: Compute test of stationarity for time series via bootstrap
###   wavelet packet method.
### Aliases: BootWPTOS
### Keywords: ts

### ** Examples

#
# Generate a stationary time series (e.g. iid standard normals)
#
x <- rnorm(512)
#
# What would be the finest scale?
#
J <- IsPowerOfTwo(length(x))
J
#[1] 9
#
# So, in WaveThresh there are 9 scales indexed 0 to 8.
#
# Let us test x for stationarity
#
# The finest scale wavelets (or packets) are at scale 8
# The next finest scale is 7.
#
# Wavelets themselves are always indexed 1, father wavelets 0.
# We don't tend to use father wavelets for stationary testing.
#
# There are 2^j packets at scale J-j (so 2 at the finest [father and
# mother], 4 at the next finest [father=0, mother=1, packets 2 and 3].
#
# Let's just look at the finest scale wavelet (8,1) and the next finest
# scale wavelet (7,1) and two other wavelet packets  (7,2) and (7,3)
#
x.test <- BootWPTOS(x=x, levs=c(8,7,7,7), indices=c(1,1,2,3), Bsims=30)
#
# Note: Bsims=30 is ALMOST CERTAINLY TOO SMALL (but it is small here because
# on installation R run these examples and I don't want it to take too long.
# 100+ is almost certainly necessary, and probably 500+ useful and 1000+
# to be "sure". If you can load the multicore library then you can
# replace lapplyfn=lapply with lapplyfn=mclapply to get a parallel processing
#
# What are the results of our test?
#
x.test
#
#	WPBootTOS test of stationarity
#
#data:  x
#= 1.8096, p-value = 0.7
#
# So, the p-value is > 0.05 so this test indicates that there is
# no evidence for non-stationarity. Running it for 1000 bootstrap simulations
# gave a p-vale of 0.736.
#
# The next example is nonstationary. However, after the series has been
# generated you should plot it. The second half has a different variance
# to the first half but it is very difficult, usually, to identify the
# different variances on a plot.
#
x2 <- c(rnorm(256), rnorm(256,sd=1.4))
#
# Let's do a test, but involve ALL non-father-wavelet packets from scales
# 8, 7, 6 and 5.
#
## Not run: 
##D x2.test <- BootWPTOS(x=x2, levs=c(8,7,7,7,rep(6,7), rep(5,15)),
##D 	indices=c(1,1,2,3, 1:7, 1:15), Bsims=30)
## End(Not run)
## Not run: x2.test
#
#	WPBootTOS test of stationarity
#
#data:  x2
#= 5.4362, p-value < 2.2e-16
#
# So, strong evidence for nonstationarity because p.value < 0.05 (much less
# than!). Again here we've only use 30 bootstrap simulations and this is
# far too small. Using Bsims=1000 and mclapply (for speed) gave a p-value
# of 0.002, so still assessed to be nonstationary, but we have more confidence
# in the answer.



