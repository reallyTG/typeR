library(wavethresh)


### Name: threshold.wd
### Title: Threshold (DWT) wavelet decomposition object
### Aliases: threshold.wd
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
# Now take the discrete wavelet transform
# N.b. I have no idea if the default wavelets here are appropriate for
# this particular examples. 
#
ynwd <- wd(ynoise)
## Not run: plot(ynwd)
#
# Now do thresholding. We'll use a universal policy, 
# and madmad deviance estimate on the finest
# coefficients and return the threshold. We'll also get it to be verbose
# so we can watch the process.
#
ynwdT1 <- threshold(ynwd, policy="universal", dev=madmad,
		levels= nlevelsWT(ynwd)-1, return.threshold=TRUE,
	verbose=TRUE)
# threshold.wd:
# Argument checking
# Universal policy...All levels at once
# Global threshold is:  0.328410967430135 
#
# Why is this the threshold? Well in this case n=512 so sqrt(2*log(n)),
# the universal threshold,
# is equal to 3.53223. Since the noise is about 0.1 (because that's what
# we generated it to be) the threshold is about 0.353.
#
# Now let's apply this threshold to all levels in the noisy wavelet object
#
ynwdT1obj <- threshold(ynwd, policy="manual", value=ynwdT1,
	levels=0:(nlevelsWT(ynwd)-1))
#
# And let's plot it
#
## Not run: plot(ynwdT1obj)
#
# You'll see that a lot of coefficients have been set to zero, or shrunk.
#
# Let's try a Bayesian examples this time!
#
ynwdT2obj <- threshold(ynwd, policy="BayesThresh")
#
# And plot the coefficients
#
## Not run: plot(ynwdT2obj)
#
# Let us now see what the actual estimates look like
#
ywr1 <- wr(ynwdT1obj)
ywr2 <- wr(ynwdT2obj)
#
# Here's the estimate using universal thresholding
#
## Not run: ts.plot(ywr1)
#
# Here's the estimate using BayesThresh 
#
## Not run: ts.plot(ywr2)



