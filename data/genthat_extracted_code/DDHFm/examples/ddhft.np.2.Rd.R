library(DDHFm)


### Name: ddhft.np.2
### Title: Data-Driven Haar-Fisz transformation
### Aliases: ddhft.np.2
### Keywords: manip

### ** Examples

#
# Generate example Poisson data set.
#
# Intensity function is steps from 1 to 32 in steps of 4 with each intensity
# lasting for 128 observations. Then sample Poisson with these intensities
#
v <- rpois(1024, lambda=rep(seq(from=1, to=32, by=4), rep(1024/8,8)))
#
# Let's take a look at this
#
## Not run: ts.plot(v)
#
# Ok. So mean of intensity clear increasing, but variance increasing too
#
# Now do data-driven Haar-Fisz
#
vhft <- ddhft.np.2(v)
#
# Now plot the variance stabilized series
#
## Not run: ts.plot(vhft$hft)
#
# The variance of the observations is much closer to 1. For example, let's
# look a the variance of the original series and the transformed one
#
# For the first intensity of 1
#
var(v[1:128])
#[1] 0.6628322
#
var(vhft$hft[1:128])
#[1] 1.025151
#
#
# And for second intensity of 5
#
#
var(v[129:256])
#[1] 4.389518
var(vhft$hft[129:256])
#[1] 1.312953
#
# So both transformed variances near to 1
#
# Now plot the estimated variance-mean relationship
#
## Not run: plot(vhft$mu, vhft$sigma)
## Not run: lines(vhft$mu, sqrt(vhft$mu))
#
# This is an approximately square root function (because you expect the
# sd of Poisson to be the square root of the mean).
#



