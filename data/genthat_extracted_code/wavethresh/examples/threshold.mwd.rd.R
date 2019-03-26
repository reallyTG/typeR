library(wavethresh)


### Name: threshold.mwd
### Title: Use threshold on an mwd object.
### Aliases: threshold.mwd
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
##
# Plot it
#
## Not run: ts.plot(ynoise)
#
# Now take the discrete multiple wavelet transform
# N.b. I have no idea if the default wavelets here are appropriate for
# this particular examples. 
#
ynmwd <- mwd(ynoise)
## Not run: plot(ynwd)
# [1] 2.020681 2.020681 2.020681 2.020681 2.020681 2.020681 2.020681
#
# Now do thresholding. We'll use the default arguments.
#
ynmwdT <- threshold(ynmwd)
#
# And let's plot it
#
## Not run: plot(ynmwdT)
#
# Let us now see what the actual estimate looks like
#
ymwr <- wr(ynmwdT)
#
# Here's the estimate... 
#
## Not run: ts.plot(ywr1)



