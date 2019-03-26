library(ChemoSpec)


### Name: sampleDistSpectra
### Title: Compute the Distance Between Samples in a Spectra Object
### Aliases: sampleDistSpectra
### Keywords: hplot

### ** Examples


require("lattice")
data(SrE.IR)
M <- sampleDistSpectra(SrE.IR, method = "cosine",
  main = "SrE.IR Spectral Angle Between Samples")




