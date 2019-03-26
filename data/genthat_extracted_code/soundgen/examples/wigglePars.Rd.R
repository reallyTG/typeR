library(soundgen)


### Name: wigglePars
### Title: Wiggle parameters
### Aliases: wigglePars
### Keywords: internal

### ** Examples

soundgen:::wigglePars(
  parList = list(
    sylLen = 250,
    pitch = data.frame(time = c(0, 1), value = c(200, 300))
  ),
  parsToWiggle = c('sylLen', 'pitch'),
  probMutation = .75,
  stepVariance = .5
)



