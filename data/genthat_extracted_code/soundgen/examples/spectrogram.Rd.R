library(soundgen)


### Name: spectrogram
### Title: Spectrogram
### Aliases: spectrogram

### ** Examples

# synthesize a sound 1 s long, with gradually increasing hissing noise
sound = soundgen(sylLen = 1000, temperature = 0.001, noise = list(
  time = c(0, 1300), value = c(-120, 0)), formantsNoise = list(
  f1 = list(freq = 5000, width = 10000)))
# playme(sound, samplingRate = 16000)

# basic spectrogram
spectrogram(sound, samplingRate = 16000)

## Not run: 
##D # change dynamic range
##D spectrogram(sound, samplingRate = 16000, dynamicRange = 40)
##D spectrogram(sound, samplingRate = 16000, dynamicRange = 120)
##D 
##D # add an oscillogram
##D spectrogram(sound, samplingRate = 16000, osc = TRUE)
##D 
##D # oscillogram on a dB scale, same height as spectrogram
##D spectrogram(sound, samplingRate = 16000,
##D             osc_dB = TRUE, heights = c(1, 1))
##D 
##D # broad-band instead of narrow-band
##D spectrogram(sound, samplingRate = 16000, windowLength = 5)
##D 
##D # focus only on values in the upper 5% for each frequency bin
##D spectrogram(sound, samplingRate = 16000, qTime = 0.95)
##D 
##D # detect 10% of the noisiest frames based on entropy and remove the pattern
##D # found in those frames (in this cases, breathing)
##D spectrogram(sound, samplingRate = 16000,  noiseReduction = 1.1,
##D   brightness = -2)  # white noise attenuated
##D 
##D # apply median smoothing in both time and frequency domains
##D spectrogram(sound, samplingRate = 16000, smoothFreq = 5,
##D   smoothTime = 5)
##D 
##D # increase contrast, reduce brightness
##D spectrogram(sound, samplingRate = 16000, contrast = 1, brightness = -1)
##D 
##D # add bells and whistles
##D spectrogram(sound, samplingRate = 16000, osc = TRUE, noiseReduction = 1.1,
##D   brightness = -1, colorTheme = 'heat.colors',
##D   ylim = c(0,5), cex.lab = .75, main = 'My spectrogram')
## End(Not run)



