library(photobiology)


### Name: interpolate_spct
### Title: Map a spectrum to new wavelength values.
### Aliases: interpolate_spct interpolate_mspct

### ** Examples


interpolate_spct(sun.spct, 400:500, NA)
interpolate_spct(sun.spct, 400:500, NULL)
interpolate_spct(sun.spct, seq(200, 1000, by=0.1), 0)
interpolate_spct(sun.spct, c(400,500), length.out=201)




