library(photobiology)


### Name: interpolate_spectrum
### Title: Calculate spectral values at a different set of wavelengths
### Aliases: interpolate_spectrum

### ** Examples


my.w.length <- 300:700
with(sun.data, interpolate_spectrum(w.length, s.e.irrad, my.w.length))




