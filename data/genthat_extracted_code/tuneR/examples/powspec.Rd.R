library(tuneR)


### Name: powspec
### Title: Powerspectrum
### Aliases: powspec

### ** Examples

  testsound <- normalize(sine(400) + sine(1000) + square(250), "16")
  pspectrum <- powspec(testsound@left, testsound@samp.rate)



