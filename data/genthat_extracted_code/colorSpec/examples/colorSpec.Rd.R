library(colorSpec)


### Name: colorSpec
### Title: constructing and testing colorSpec Objects
### Aliases: colorSpec is.colorSpec as.colorSpec as.colorSpec.default
### Keywords: colorSpec

### ** Examples

#  make a synthetic Gaussian bandpass filter

center = 600
wave   = 400:700
trans  = exp( -(wave-center)^2 / 20^2 )

filter.bp   = colorSpec( trans, wave, quantity='transmittance', specnames='myfilter' )

organization( filter.bp )  # returns:  "vector"

# and now plot it
plot( filter.bp )



