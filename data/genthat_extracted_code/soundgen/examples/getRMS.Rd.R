library(soundgen)


### Name: getRMS
### Title: RMS amplitude per frame
### Aliases: getRMS

### ** Examples

s = soundgen() + .1  # with added DC offset
plot(s, type = 'l')
r = getRMS(s, samplingRate = 16000,
  windowLength = 40, overlap = 50, killDC = TRUE,
  col = 'green', lty = 2, main = 'RMS envelope')
# short window = jagged envelope
r = getRMS(s, samplingRate = 16000,
  windowLength = 5, overlap = 0, killDC = TRUE,
  col = 'green', lty = 2, main = 'RMS envelope')
## Not run: 
##D r = getRMS('~/Downloads/temp/032_ut_anger_30-m-roar-curse.wav')
## End(Not run)



