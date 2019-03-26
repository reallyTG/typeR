library(tuneR)


### Name: Waveforms
### Title: Create Wave Objects of Special Waveforms
### Aliases: Waveforms sine sawtooth square silence noise pulse
### Keywords: datagen

### ** Examples

Wobj <- sine(440, duration = 1000)
Wobj2 <- noise(duration = 1000)
Wobj3 <- pulse(220, duration = 1000)
plot(Wobj)
plot(Wobj2)
plot(Wobj3)



