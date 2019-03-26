library(haarfisz)


### Name: hft
### Title: hft
### Aliases: hft
### Keywords: manip

### ** Examples

#
# Generate Poisson data, half with one intensity, and half with a larger one
#
v <- c( rpois(64, lambda=1), rpois(64, lambda=10))
#
# Plot it to note that the variation is bigger in the second half
# (and the mean, but this is not important for this bit)
#
## Not run: ts.plot(v)
#
# Now do the Haar-Fisz transform
#
vhft <- hft(v)
#
# Now plot this, and see that the variance of the second bit is now comparable
# to the first
#
## Not run: ts.plot(vhft)



