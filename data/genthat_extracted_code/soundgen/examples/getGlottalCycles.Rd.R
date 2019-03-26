library(soundgen)


### Name: getGlottalCycles
### Title: Divide f0 contour into glottal cycles
### Aliases: getGlottalCycles
### Keywords: internal

### ** Examples

# 100 ms of audio with f0 steadily increasing from 150 to 200 Hz
soundgen:::getGlottalCycles(seq(150, 200, length.out = 350),
  samplingRate = 3500)



