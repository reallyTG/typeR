library(soundgen)


### Name: getBandwidth
### Title: Get bandwidth
### Aliases: getBandwidth
### Keywords: internal

### ** Examples

f = 1:5000
plot(f, soundgen:::getBandwidth(f), type = 'l',
  xlab = 'Formant frequency, Hz', ylab = 'Estimated bandwidth, Hz')



