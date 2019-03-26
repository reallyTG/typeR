library(freqdom)


### Name: fourier.inverse
### Title: Coefficients of a discrete Fourier transform
### Aliases: fourier.inverse
### Keywords: frequency.domain time.domain

### ** Examples

Y = rar(100)
grid = c(pi*(1:2000) / 1000 - pi) #a dense grid on -pi, pi
fourier.inverse(spectral.density(Y, q=2, freq=grid))

# compare this to
cov.structure(Y)



