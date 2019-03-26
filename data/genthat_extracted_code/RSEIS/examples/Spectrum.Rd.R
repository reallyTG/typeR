library(RSEIS)


### Name: Spectrum
### Title: Calculate Different Spectrum Types in Physical Units
### Aliases: Spectrum
### Keywords: math

### ** Examples

## example time series
x = rnorm(1000)
dt = 0.01

## power spectrum, multi-taper method, one-sided
S = Spectrum(x, dt, type = 1, method = 2, one_sided = TRUE)
sum(S$spectrum) * S$df ## frequency-domain power
mean(x^2) ## time-domain power

## energy spectrum, fft method, two-sided
S = Spectrum(x, dt, type = 2, method = 1, one_sided = FALSE)
sum(S$spectrum) * S$df ## frequency-domain energy
sum(x^2) * dt ## time-domain energy



