library(photobiology)


### Name: fscale
### Title: Rescale a spectrum using a summary function
### Aliases: fscale fscale.default fscale.source_spct fscale.response_spct
###   fscale.filter_spct fscale.reflector_spct fscale.raw_spct
###   fscale.cps_spct fscale.generic_spct fscale.source_mspct
###   fscale.response_mspct fscale.filter_mspct fscale.reflector_mspct
###   fscale.raw_mspct fscale.cps_mspct fscale.generic_mspct fshift.default

### ** Examples

fscale(sun.spct, f = "mean")
fscale(sun.spct, f = "mean", na.rm = TRUE)
fscale(sun.spct, f = sum)
fscale(sun.spct, f = function(x) {sum(x) / length(x)})




