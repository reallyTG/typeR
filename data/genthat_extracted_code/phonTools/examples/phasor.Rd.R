library(phonTools)


### Name: phasor
### Title: Plot Phasors
### Aliases: phasor

### ** Examples


noise = rnorm (100)
phasors = fft(noise)

par (mfrow = c(1,3))
phasor (phasors)
phasor (phasors, circle = TRUE)
phasor (phasors, scaled = FALSE)




