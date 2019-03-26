library(cdom)


### Name: cdom_spectral_curve
### Title: Calculate the spectral curve of CDOM spectra.
### Aliases: cdom_spectral_curve

### ** Examples

data(spectra)

res <- cdom_spectral_curve(spectra$wavelength, spectra$spc2)
plot(res$wl, res$s, type = "l")



