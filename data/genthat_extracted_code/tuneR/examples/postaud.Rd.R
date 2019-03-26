library(tuneR)


### Name: postaud
### Title: Equal loudness compression
### Aliases: postaud

### ** Examples

  testsound <- normalize(sine(400) + sine(1000) + square(250), "16")
  pspectrum <- powspec(testsound@left, testsound@samp.rate)
  aspectrum <- audspec(pspectrum, testsound@samp.rate)
  paspectrum <- postaud(x = aspectrum$aspectrum, fmax = 5000, 
    fbtype = "mel")



