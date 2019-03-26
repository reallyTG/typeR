library(soundgen)


### Name: findZeroCrossing
### Title: Find zero crossing
### Aliases: findZeroCrossing
### Keywords: internal

### ** Examples

ampl = sin(1:100/2)
plot(ampl, type = 'b')
lines(1:100, rep(0,100), lty = 2)
zc = vector()
for (i in 1:length(ampl)){
  zc[i] = soundgen:::findZeroCrossing (ampl, i)
  # find zc closest to each of 100 points
}
for (z in unique(zc)){
  points(z, ampl[z], col = 'red', pch = 17)
  # only on upward segments
}
zc # see which zc is closest to each point



