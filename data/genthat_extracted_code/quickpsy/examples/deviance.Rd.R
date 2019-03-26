library(quickpsy)


### Name: deviance
### Title: Calculates the deviances
### Aliases: deviance

### ** Examples

library(MPDiR) # contains the Vernier data
fit <- quickpsy(Vernier, Phaseshift, NumUpward, N,
                grouping = .(Direction, WaveForm, TempFreq), B = 20)
deviance(fit)



