library(photobiology)


### Name: interpolate_wl
### Title: Map spectra to new wavelength values.
### Aliases: interpolate_wl interpolate_wl.default
###   interpolate_wl.generic_spct interpolate_wl.generic_mspct

### ** Examples

interpolate_wl(sun.spct, 400:500, NA)
interpolate_wl(sun.spct, 400:500, NULL)
interpolate_wl(sun.spct, seq(200, 1000, by=0.1), 0)
interpolate_wl(sun.spct, c(400,500), length.out=201)




