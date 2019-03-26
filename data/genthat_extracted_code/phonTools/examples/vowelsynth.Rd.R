library(phonTools)


### Name: vowelsynth
### Title: Vowel Synthesis
### Aliases: vowelsynth

### ** Examples


## uncomment to run

## The following examples are based on my vowels 
i = vowelsynth (returnsound = FALSE, f0 = c(125,105))
#a = vowelsynth (ffs = c(700, 1300, 2300, 3400, 4400), 
#returnsound = FALSE, f0 = c(125,105))
#e = vowelsynth (ffs = c(400, 2000, 2600, 3400, 4400), 
#returnsound = FALSE, f0 = c(125,105))
#o = vowelsynth (ffs = c(400, 900, 2300, 3400, 4400), 
#returnsound = FALSE, f0 = c(125,105))
#u = vowelsynth (ffs = c(300, 750, 2300, 3400, 4400), 
#returnsound = FALSE, f0 = c(125,105))

#silence = rep(0, 1000)
#vowels = c(a, silence, e, silence, i, silence, o, silence, u)

#writesound (vowels, filename = 'vowels.wav', fs = 10000)

## an example of a synthetic diphthong
#ei = vowelsynth (ffs = list(c(400, 2000, 2600, 3400, 4400), 
#c(270, 2200, 2800, 3400, 4400)), f0 = c(125,105))
#writesound (ei)
#spectrogram (ei, pause = FALSE)




