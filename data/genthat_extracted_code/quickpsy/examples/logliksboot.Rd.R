library(quickpsy)


### Name: logliksboot
### Title: Calculates the bootstrap loglikelihoods
### Aliases: logliksboot

### ** Examples

library(MPDiR) # contains the Vernier data
fit <- quickpsy(Vernier, Phaseshift, NumUpward, N,
                grouping = .(Direction, WaveForm, TempFreq), B = 20)
logliksboot(fit)



