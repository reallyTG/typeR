library(wavethresh)


### Name: threshold.wp
### Title: Threshold wavelet packet decomposition object
### Aliases: threshold.wp
### Keywords: smooth nonlinear

### ** Examples

#
# Generate some test data
#
test.data <- example.1()$y
## Not run: ts.plot(test.data)
#
# Generate some noisy data
#
ynoise <- test.data + rnorm(512, sd=0.1)
#
# Plot it
#
## Not run: ts.plot(ynoise)
#
# Now take the discrete wavelet packet transform
# N.b. I have no idea if the default wavelets here are appropriate for
# this particular examples. 
#
ynwp <- wp(ynoise)
#
# Now do thresholding. We'll use a universal policy, 
# and madmad deviance estimate on the finest
# coefficients and return the threshold. We'll also get it to be verbose
# so we can watch the process.
#
ynwpT1 <- threshold(ynwp, policy="universal", dev=madmad)
#
# This is just another wp object. Is it sensible?
# Probably not as we have just thresholded the scaling function coefficients
# as well. So the threshold might be more sensibly computed on the wavelet
# coefficients at the finest scale and then this threshold applied to the
# whole wavelet tree??



