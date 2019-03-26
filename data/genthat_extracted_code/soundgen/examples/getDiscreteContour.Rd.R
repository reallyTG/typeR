library(soundgen)


### Name: getDiscreteContour
### Title: Discrete smooth contour from anchors
### Aliases: getDiscreteContour
### Keywords: internal

### ** Examples

# for a bout consisting of 10 syllables
soundgen:::getDiscreteContour(len = 10, interpol = 'spline', plot = TRUE,
  ylab = 'Semitones', anchors = data.frame(time = c(0, .2, .6, 1),
  value = c(0, -3, 1, 0)))



