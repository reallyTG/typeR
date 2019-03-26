library(soundgen)


### Name: modulationSpectrum
### Title: Modulation spectrum
### Aliases: modulationSpectrum

### ** Examples

# white noise
ms = modulationSpectrum(runif(16000), samplingRate = 16000,
  logSpec = FALSE, power = TRUE, logWarp = NULL)

# harmonic sound
s = soundgen()
ms = modulationSpectrum(s, samplingRate = 16000,
  logSpec = FALSE, power = TRUE, logWarp = NULL)

# embellish
ms = modulationSpectrum(s, samplingRate = 16000,
  xlab = 'Temporal modulation, Hz', ylab = 'Spectral modulation, 1/KHz',
  colorTheme = 'seewave', main = 'Modulation spectrum', lty = 3)
## Not run: 
##D # Input can also be a list of waveforms (numeric vectors)
##D ss = vector('list', 10)
##D for (i in 1:length(ss)) {
##D   ss[[i]] = soundgen(sylLen = runif(1, 100, 1000), temperature = .4,
##D     pitch = runif(3, 400, 600))
##D }
##D # lapply(ss, playme)
##D ms = modulationSpectrum(ss[[1]], samplingRate = 16000)  # the first sound
##D ms = modulationSpectrum(ss, samplingRate = 16000)  # all 10 sounds
##D 
##D # As with spectrograms, there is a tradeoff in time-frequency resolution
##D s = soundgen(pitch = 500, amFreq = 50, amDep = 100, samplingRate = 44100)
##D # playme(s, samplingRate = 44100)
##D ms = modulationSpectrum(s, samplingRate = 44100,
##D   windowLength = 50, overlap = 0)  # poor temporal resolution
##D ms = modulationSpectrum(s, samplingRate = 44100,
##D   windowLength = 5, overlap = 80)  # poor frequency resolution
##D ms = modulationSpectrum(s, samplingRate = 44100,
##D   windowLength = 15, overlap = 80)  # a reasonable compromise
##D 
##D # Input can be a wav/mp3 file
##D ms = modulationSpectrum('~/Downloads/temp/200_ut_fear-bungee_11.wav')
##D ms = modulationSpectrum('~/Downloads/temp/200_ut_fear-bungee_11.wav',
##D   kernelSize = 17,  # more smoothing
##D   xlim = c(-20, 20), ylim = c(0, 4),  # zoom in on the central region
##D   quantiles = c(.25, .5, .8),  # customize contour lines
##D   colorTheme = 'heat.colors',  # alternative palette
##D   logWarp = NULL,              # don't log-warp the modulation spectrum
##D   power = 2)  # ^2
##D # NB: xlim/ylim currently won't work properly with logWarp on
##D 
##D # Input can be path to folder with audio files (average modulation spectrum)
##D ms = modulationSpectrum('~/Downloads/temp/', kernelSize = 11)
##D # NB: longer files will be split into fragments <maxDur in length
##D 
##D # "power = 2" returns squared modulation spectrum - note that this affects
##D the roughness measure!
##D # A sound with ~3 syllables per second and only downsweeps in F0 contour
##D s = soundgen(nSyl = 8, sylLen = 200, pauseLen = 100, pitch = c(300, 200))
##D # playme(s)
##D ms = modulationSpectrum(s, samplingRate = 16000, maxDur = .5,
##D   xlim = c(-25, 25), colorTheme = 'seewave', logWarp = NULL,
##D   power = 2)
##D # note the asymmetry b/c of downsweeps
##D ms$roughness
##D # compare:
##D modulationSpectrum(s, samplingRate = 16000, maxDur = .5,
##D   xlim = c(-25, 25), colorTheme = 'seewave', logWarp = NULL,
##D   power = 1)$roughness  # much higher roughness
##D 
##D # Plotting with or without log-warping the modulation spectrum:
##D ms = modulationSpectrum(soundgen(), samplingRate = 16000,
##D   logWarp = NA, plot = T)
##D ms = modulationSpectrum(soundgen(), samplingRate = 16000,
##D   logWarp = 2, plot = T)
##D ms = modulationSpectrum(soundgen(), samplingRate = 16000,
##D   logWarp = 4.5, plot = T)
##D 
##D # logWarp and kernelSize have no effect on roughness
##D # because it is calculated before these transforms:
##D modulationSpectrum(s, samplingRate = 16000, logWarp = 5)$roughness
##D modulationSpectrum(s, samplingRate = 16000, logWarp = NA)$roughness
##D modulationSpectrum(s, samplingRate = 16000, kernelSize = 17)$roughness
##D 
##D # Log-transform the spectrogram prior to 2D FFT (affects roughness):
##D ms = modulationSpectrum(soundgen(), samplingRate = 16000, logSpec = FALSE)
##D ms = modulationSpectrum(soundgen(), samplingRate = 16000, logSpec = TRUE)
## End(Not run)



