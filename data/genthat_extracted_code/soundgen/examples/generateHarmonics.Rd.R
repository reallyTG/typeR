library(soundgen)


### Name: generateHarmonics
### Title: Generate harmonics
### Aliases: generateHarmonics
### Keywords: internal

### ** Examples

rolloffExact1 = c(.2, .2, 1, .2, .2)
s1 = soundgen:::generateHarmonics(pitch = seq(400, 530, length.out = 1500),
                       rolloffExact = rolloffExact1)
spectrogram(s1, 16000, ylim = c(0, 4))
# playme(s1, 16000)

rolloffExact2 = matrix(c(.2, .2, 1, .2, .2,
                         1, .5, .2, .1, .05), ncol = 2)
s2 = soundgen:::generateHarmonics(pitch = seq(400, 530, length.out = 1500),
                       rolloffExact = rolloffExact2)
spectrogram(s2, 16000, ylim = c(0, 4))
# playme(s2, 16000)



