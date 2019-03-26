library(tuneR)


### Name: lpc2cep
### Title: LPC to cepstra conversion
### Aliases: lpc2cep

### ** Examples

  testsound <- normalize(sine(400) + sine(1000) + square(250), "16")
  pspectrum <- powspec(testsound@left, testsound@samp.rate)
  aspectrum <- audspec(pspectrum, testsound@samp.rate)
  lpcas <- dolpc(aspectrum$aspectrum, 8)
  cepstra <- lpc2cep(lpcas)



