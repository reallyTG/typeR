library(soundgen)


### Name: gaussianSmooth2D
### Title: Gaussian smoothing in 2D
### Aliases: gaussianSmooth2D

### ** Examples

s = spectrogram(soundgen(), samplingRate = 16000,
  output = 'original', plot = FALSE)
# image(log(s))
s1 = gaussianSmooth2D(s, kernelSize = 11, plotKernel = TRUE)
# image(log(s1))



