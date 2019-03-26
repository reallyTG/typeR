library(soundgen)


### Name: addFormants
### Title: Add formants
### Aliases: addFormants

### ** Examples

sound = c(rep(0, 1000), runif(16000), rep(0, 1000))  # white noise
# NB: pad with silence to avoid artefacts if removing formants
# playme(sound)
# spectrogram(sound, samplingRate = 16000)

# add F1 = 900, F2 = 1300 Hz
sound_filtered = addFormants(sound, formants = c(900, 1300))
# playme(sound_filtered)
# spectrogram(sound_filtered, samplingRate = 16000)

# ...and remove them again (assuming we know what the formants are)
sound_inverse_filt = addFormants(sound_filtered,
                                 formants = c(900, 1300),
                                 action = 'remove')
# playme(sound_inverse_filt)
# spectrogram(sound_inverse_filt, samplingRate = 16000)

## Not run: 
##D # Use the spectral envelope of an existing recording (bleating of a sheep)
##D # (see also the same example with noise as source in ?generateNoise)
##D data(sheep, package = 'seewave')  # import a recording from seewave
##D sound_orig = as.numeric(scale(sheep@left))
##D samplingRate = sheep@samp.rate
##D sound_orig = sound_orig / max(abs(sound_orig))  # range -1 to +1
##D # playme(sound_orig, samplingRate)
##D 
##D # get a few pitch anchors to reproduce the original intonation
##D pitch = analyze(sound_orig, samplingRate = samplingRate,
##D   pitchMethod = c('autocor', 'dom'))$pitch
##D pitch = pitch[!is.na(pitch)]
##D pitch = pitch[seq(1, length(pitch), length.out = 10)]
##D 
##D # extract a frequency-smoothed version of the original spectrogram
##D # to use as filter
##D specEnv_bleating = spectrogram(sound_orig, windowLength = 5,
##D  samplingRate = samplingRate, output = 'original', plot = FALSE)
##D # image(t(log(specEnv_bleating)))
##D 
##D # Synthesize source only, with flat spectrum
##D sound_unfilt = soundgen(sylLen = 2500, pitch = pitch,
##D   rolloff = 0, rolloffOct = 0, rolloffKHz = 0,
##D   temperature = 0, jitterDep = 0, subDep = 0,
##D   formants = NULL, lipRad = 0, samplingRate = samplingRate)
##D # playme(sound_unfilt, samplingRate)
##D # seewave::meanspec(sound_unfilt, f = samplingRate, dB = 'max0')  # ~flat
##D 
##D # Force spectral envelope to the shape of target
##D sound_filt = addFormants(sound_unfilt, formants = NULL,
##D   spectralEnvelope = specEnv_bleating, samplingRate = samplingRate)
##D # playme(sound_filt, samplingRate)  # playme(sound_orig, samplingRate)
##D # spectrogram(sound_filt, samplingRate)  # spectrogram(sound_orig, samplingRate)
##D 
##D # The spectral envelope is now similar to the original recording. Compare:
##D par(mfrow = c(1, 2))
##D seewave::meanspec(sound_orig, f = samplingRate, dB = 'max0', alim = c(-50, 20))
##D seewave::meanspec(sound_filt, f = samplingRate, dB = 'max0', alim = c(-50, 20))
##D par(mfrow = c(1, 1))
##D # NB: but the source of excitation in the original is actually a mix of
##D # harmonics and noise, while the new sound is purely tonal
## End(Not run)



