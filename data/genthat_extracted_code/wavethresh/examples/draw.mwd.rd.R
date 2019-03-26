library(wavethresh)


### Name: draw.mwd
### Title: Draws a wavelet or scaling function used to compute an 'mwd'
###   object
### Aliases: draw.mwd
### Keywords: hplot

### ** Examples

#
# Do a multiple wavelet decomposition on vector: ynoise
#
ynoise <- rnorm(512, sd = 0.1)
ymwd <- mwd(ynoise,filter.type="Geronimo")
#
# Draw a picture of the second Geronimo wavelet.
#
## Not run: draw(ymwd,psi=2)
#
#



