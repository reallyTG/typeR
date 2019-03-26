library(oce)


### Name: oceSpectrum
### Title: Wrapper to give normalized spectrum
### Aliases: oceSpectrum oce.spectrum

### ** Examples

  x <- rnorm(1e3)
  s <- spectrum(x, plot=FALSE)
  ss <- oce.spectrum(x, plot=FALSE)
  cat("variance of x=", var(x), "\n")
  cat("integral of     spectrum=", sum(s$spec)*diff(s$freq[1:2]), "\n")
  cat("integral of oce.spectrum=", sum(ss$spec)*diff(ss$freq[1:2]), "\n")



