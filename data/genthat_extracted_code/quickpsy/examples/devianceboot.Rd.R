library(quickpsy)


### Name: devianceboot
### Title: Calculates the bootsrap deviances
### Aliases: devianceboot

### ** Examples

library(MPDiR) # contains the Vernier data
fit <- quickpsy(Vernier, Phaseshift, NumUpward, N,
                grouping = .(Direction, WaveForm, TempFreq), B = 20)
devianceboot(fit)



