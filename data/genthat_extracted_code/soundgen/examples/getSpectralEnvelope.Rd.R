library(soundgen)


### Name: getSpectralEnvelope
### Title: Spectral envelope
### Aliases: getSpectralEnvelope

### ** Examples

# [a] with F1-F3 visible
e = getSpectralEnvelope(nr = 512, nc = 50,
  formants = soundgen:::convertStringToFormants('a'),
  temperature = 0, plot = TRUE)
# image(t(e))  # to plot the output on a linear scale instead of dB

# some "wiggling" of specified formants plus extra formants on top
e = getSpectralEnvelope(nr = 512, nc = 50,
  formants = soundgen:::convertStringToFormants('a'),
  temperature = 0.1, formantDepStoch = 20, plot = TRUE)

# a schwa based on the length of vocal tract = 15.5 cm
e = getSpectralEnvelope(nr = 512, nc = 50, formants = NA,
  temperature = .1, vocalTract = 15.5, plot = TRUE)

# no formants at all, only lip radiation
e = getSpectralEnvelope(nr = 512, nc = 50,
  formants = NA, temperature = 0, plot = TRUE)

# mouth opening
e = getSpectralEnvelope(nr = 512, nc = 50,
  vocalTract = 16, plot = TRUE, lipRad = 6, noseRad = 4,
  mouthAnchors = data.frame(time = c(0, .5, 1), value = c(0, 0, .5)))

# scale formant amplitude and/or bandwidth
e = getSpectralEnvelope(nr = 512, nc = 50,
  formants = soundgen:::convertStringToFormants('a'),
  formantWidth = 2, formantDep = .5,
  temperature = 0, plot = TRUE)

# manual specification of formants
e = getSpectralEnvelope(nr = 512, nc = 50, plot = TRUE, samplingRate = 16000,
  formants = list(f1 = data.frame(time = c(0, 1), freq = c(900, 500),
                                  amp = 20, width = c(80, 50)),
                  f2 = data.frame(time = c(0, 1), freq = c(1200, 2500),
                                  amp = 20, width = 100),
                  f3 = data.frame(time = 0, freq = 2900,
                                  amp = 20, width = 120)))



