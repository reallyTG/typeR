library(wavethresh)


### Name: plot.wp
### Title: Plot wavelet packet transform coefficients
### Aliases: plot.wp
### Keywords: hplot

### ** Examples

#
# Generate some test data
#
v <- DJ.EX()$blocks
#
# Let's plot these to see what they look like
#
## Not run: plot(v, type="l")
#
# Do a wavelet packet transform
#
vwp <- wp(v)
#
# And create a node vector
#
vnv <- MaNoVe(vwp)
#
# Now plot the wavelet packets with the associated node vector
#
## Not run: plot(vwp, vnv, color.force=T, WaveletColor="red", dotted.turn.on=7)
#
# The wavelet coefficients are plotted in red. Packets from the node vector
# are depicted in green. The node vector gets plotted after the wavelet
# coefficients so the green packets overlay the red (retry the plot command
# but without the vnv object to see just the
# wavelet coefficients). The vertical dotted lines start at resolution
# level 7.
#
#



