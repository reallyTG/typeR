library(wavethresh)


### Name: plot.wst
### Title: Plot packet-ordered non-decimated wavelet transform
###   coefficients.
### Aliases: plot.wst
### Keywords: hplot

### ** Examples

#
# Generate some test data
#
v <- DJ.EX()$heavi
#
# Let's plot these to see what they look like
#
## Not run: plot(v, type="l")
#
# Do a packet-ordered non-decimated wavelet packet transform
#
vwst <- wst(v)
#
# Now plot the coefficients
#
## Not run: plot(vwst)
#
# Note that the "original" function is at the bottom of the plot.
# The finest scale coefficients (two packets) are immediately above.
# Increasingly coarser scale coefficients are above that!
#



