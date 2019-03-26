library(soundgen)


### Name: getSigmoid
### Title: Get sigmoid filter
### Aliases: getSigmoid
### Keywords: internal

### ** Examples

for (shape in c(0, -.1, .1, -1, 1)) {
  s = soundgen:::getSigmoid(shape = shape, len = 1000, samplingRate = 500,  freq = 2)
  plot(s, type = 'l',  main = paste('shape =', shape), xlab = '', ylab = '')
}



