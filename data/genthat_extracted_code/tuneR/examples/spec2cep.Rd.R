library(tuneR)


### Name: spec2cep
### Title: Spectra to Cepstra Conversion
### Aliases: spec2cep

### ** Examples

  testsound <- normalize(sine(400) + sine(1000) + square(250), "16")
  pspectrum <- powspec(testsound@left, testsound@samp.rate)
  aspectrum <- audspec(pspectrum, testsound@samp.rate)
  cepstra <- spec2cep(aspectrum$aspectrum)



