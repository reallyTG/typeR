library(soundgen)


### Name: playme
### Title: Play audio
### Aliases: playme

### ** Examples

# playme('~/myfile.wav')
f0_Hz = 440
sound = sin(2 * pi * f0_Hz * (1:16000) / 16000)
# playme(sound, 16000)
# in case of errors, look into tuneR::play()



