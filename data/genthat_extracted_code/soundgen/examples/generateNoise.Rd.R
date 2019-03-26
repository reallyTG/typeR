library(soundgen)


### Name: generateNoise
### Title: Generate noise
### Aliases: generateNoise

### ** Examples

# .5 s of white noise
samplingRate = 16000
noise1 = generateNoise(len = samplingRate * .5,
  samplingRate = samplingRate)
# playme(noise1, samplingRate)
# seewave::meanspec(noise1, f = samplingRate)

# Percussion (run a few times to notice stochasticity due to temperature = .25)
noise2 = generateNoise(len = samplingRate * .15, noiseAnchors = c(0, -80),
  rolloffNoise = c(4, -6), attackLen = 5, temperature = .25)
noise3 = generateNoise(len = samplingRate * .25, noiseAnchors = c(0, -40),
  rolloffNoise = c(4, -20), attackLen = 5, temperature = .25)
# playme(c(noise2, noise3), samplingRate)

## Not run: 
##D playback = c(TRUE, FALSE)[2]
##D # 1.2 s of noise with rolloff changing from 0 to -12 dB above 2 kHz
##D noise = generateNoise(len = samplingRate * 1.2,
##D   rolloffNoise = c(0, -12), noiseFlatSpec = 2000,
##D   samplingRate = samplingRate, play = playback)
##D # spectrogram(noise, samplingRate, osc = TRUE)
##D 
##D # Similar, but using the dataframe format to specify a more complicated
##D # contour for rolloffNoise:
##D noise = generateNoise(len = samplingRate * 1.2,
##D   rolloffNoise = data.frame(time = c(0, .3, 1), value = c(-12, 0, -12)),
##D   noiseFlatSpec = 2000, samplingRate = samplingRate, play = playback)
##D # spectrogram(noise, samplingRate, osc = TRUE)
##D 
##D # To create a sibilant [s], specify a single strong, broad formant at ~7 kHz:
##D windowLength_points = 1024
##D spectralEnvelope = soundgen:::getSpectralEnvelope(
##D   nr = windowLength_points / 2, nc = 1, samplingRate = samplingRate,
##D  formants = list('f1' = data.frame(time = 0, freq = 7000,
##D                                    amp = 50, width = 2000)))
##D noise = generateNoise(len = samplingRate,
##D   samplingRate = samplingRate, spectralEnvelope = as.numeric(spectralEnvelope),
##D   play = playback)
##D # plot(spectralEnvelope, type = 'l')
##D 
##D # Low-frequency, wind-like noise
##D spectralEnvelope = soundgen:::getSpectralEnvelope(
##D   nr = windowLength_points / 2, nc = 1, lipRad = 0,
##D   samplingRate = samplingRate, formants = list('f1' = data.frame(
##D     time = 0, freq = 150, amp = 30, width = 90)))
##D noise = generateNoise(len = samplingRate,
##D   samplingRate = samplingRate, spectralEnvelope = as.numeric(spectralEnvelope),
##D   play = playback)
##D 
##D # Manual filter, e.g. for a kettle-like whistle (narrow-band noise)
##D spectralEnvelope = c(rep(0, 100), 120, rep(0, 100))  # any length is fine
##D # plot(spectralEnvelope, type = 'b')  # notch filter at Nyquist / 2, here 4 kHz
##D noise = generateNoise(len = samplingRate, spectralEnvelope = spectralEnvelope,
##D   samplingRate = samplingRate, play = playback)
##D 
##D # Compare to a similar sound created with soundgen()
##D # (unvoiced only, a single formant at 4 kHz)
##D noise_s = soundgen(pitch = NULL,
##D   noise = data.frame(time = c(0, 1000), value = c(0, 0)),
##D   formants = list(f1 = data.frame(freq = 4000, amp = 80, width = 20)),
##D   play = playback)
##D 
##D 
##D # Use the spectral envelope of an existing recording (bleating of a sheep)
##D # (see also the same example with tonal source in ?addFormants)
##D data(sheep, package = 'seewave')  # import a recording from seewave
##D sound_orig = as.numeric(sheep@left)
##D samplingRate = sheep@samp.rate
##D # playme(sound_orig, samplingRate)
##D 
##D # extract the original spectrogram
##D windowLength = c(5, 10, 50, 100)[1]  # try both narrow-band (eg 100 ms)
##D # to get "harmonics" and wide-band (5 ms) to get only formants
##D spectralEnvelope = spectrogram(sound_orig, windowLength = windowLength,
##D   samplingRate = samplingRate, output = 'original')
##D sound_noise = generateNoise(len = length(sound_orig),
##D   spectralEnvelope = spectralEnvelope, rolloffNoise = 0,
##D   samplingRate = samplingRate, play = playback)
##D # playme(sound_noise, samplingRate)
##D 
##D # The spectral envelope is similar to the original recording. Compare:
##D par(mfrow = c(1, 2))
##D seewave::meanspec(sound_orig, f = samplingRate, dB = 'max0')
##D seewave::meanspec(sound_noise, f = samplingRate, dB = 'max0')
##D par(mfrow = c(1, 1))
##D # However, the excitation source is now white noise
##D # (which sounds like noise if windowLength is ~5-10 ms,
##D # but becomes more and more like the original at longer window lengths)
## End(Not run)



