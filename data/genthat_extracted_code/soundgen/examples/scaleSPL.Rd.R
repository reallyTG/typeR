library(soundgen)


### Name: scaleSPL
### Title: Scale SPL
### Aliases: scaleSPL
### Keywords: internal

### ** Examples

sound = runif(100) * getSmoothContour(c(0, 1, 0), len = 100)
# plot(sound, type = 'l')
sound_scaled = soundgen:::scaleSPL(sound)
# plot(sound_scaled, type = 'l')



