library(costat)


### Name: localvar
### Title: Compute the time-localized (unconditional) variance for a time
###   series
### Aliases: localvar
### Keywords: ts

### ** Examples

#
# Let's look at a iid standard normal sequence, variance should be 1, always
# for all times.
#
zsim <- rnorm(64)
#
# Note, in the following I use var as the method of deviance estimation,
# as described in the help there it can be more accurate when transformations
# are not used.
#
z.ews <- ewspec(zsim, smooth.dev=var)$S
#
# Compute the local variance
#
z.lv <- localvar(z.ews)
#
# Plot the local variance against time
#
## Not run: ts.plot(z.lv)
#
# Should be around 1. Note, the vertical scale of the plot might be
# deceptive, as R plots expand the function to the maximum available
# space. If you look again it should be quite close to 1 (e.g. on the
# example I am looking at now the variance is within +/- 0.15 of 1.
#
# However, it might not be close to 1 because the sample size is quite small,
# only 64, so repeat the above analysis with a larger sample size, e.g. 1024.
#



