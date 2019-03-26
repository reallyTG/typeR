library(soundgen)


### Name: splitContour
### Title: Split contour
### Aliases: splitContour
### Keywords: internal

### ** Examples

soundgen:::splitContour(data.frame(time = c(0, 370, 650, 655, 1050, 1400),
  value = c(360, 316, 345, 550, 610, 590)))
soundgen:::splitContour(data.frame(time = c(0, .2, .205, .8, .81, 1),
  value = c(360, 316, 345, 550, 610, 590)))
soundgen:::splitContour(data.frame(time = c(0, .4, .45, .6, .8, 1),
  value = c(360, 316, 345, 550, 610, 590)))
soundgen:::splitContour(data.frame(time = c(0, .4, .45, .6, .8, 1),
  value = c(360, 316, 345, 550, 610, 590)),
  discontThres = .1)
soundgen:::splitContour(data.frame(time = c(0, 1),
  value = c(360, 590)))



