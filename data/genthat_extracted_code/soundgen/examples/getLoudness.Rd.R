library(soundgen)


### Name: getLoudness
### Title: Get loudness
### Aliases: getLoudness

### ** Examples

sounds = list(
  sound1 = runif(8000, -1, 1),  # white noise
  sound2 = sin(2*pi*1000/16000*(1:8000))  # pure tone at 1 kHz
)
loud = rep(0, length(sounds))
for (i in 1:length(sounds)) {
  # playme(sounds[[i]], 16000)
  l = getLoudness(
    x = sounds[[i]], samplingRate = 16000,
    windowLength = 20, step = NULL,
    overlap = 50, SPL_measured = 64,
    Pref = 2e-5, plot = FALSE)
  loud[i] = mean(l$loudness)
}
loud  # white noise is twice as loud

## Not run: 
##D   l = getLoudness(soundgen(), SPL_measured = 70,
##D                   samplingRate = 16000, plot = TRUE, osc = TRUE)
##D   # The estimated loudness in sone depends on target SPL
##D   l = getLoudness(soundgen(), SPL_measured = 40,
##D                   samplingRate = 16000, plot = TRUE)
##D 
##D   # ...but not (much) on windowLength and samplingRate
##D   l = getLoudness(soundgen(), SPL_measured = 40, windowLength = 50,
##D                   samplingRate = 16000, plot = TRUE)
## End(Not run)



