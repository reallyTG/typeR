library(tuneR)


### Name: dolpc
### Title: (Perceptive) Linear Prediction
### Aliases: dolpc

### ** Examples

  testsound <- normalize(sine(400) + sine(1000) + square(250), "16")
  pspectrum <- powspec(testsound@left, testsound@samp.rate)
  aspectrum <- audspec(pspectrum, testsound@samp.rate)$aspectrum
  lpcas <- dolpc(aspectrum, 10)



