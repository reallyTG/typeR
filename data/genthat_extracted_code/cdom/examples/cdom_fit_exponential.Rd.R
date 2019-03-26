library(cdom)


### Name: cdom_fit_exponential
### Title: Fit an exponential model to CDOM data.
### Aliases: cdom_fit_exponential

### ** Examples

# Fit an exponential model using the reference wavelength 350 between 190 and 900 nm.

data(spectra)

fit <- cdom_fit_exponential(spectra$wavelength, spectra$spc1, 350, 190, 900)
str(fit)

plot(spectra$wavelength, spectra$spc1)
lines(spectra$wavelength, fit$data$.fitted, col = "red")



