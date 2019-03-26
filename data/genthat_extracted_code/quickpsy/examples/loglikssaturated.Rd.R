library(quickpsy)


### Name: loglikssaturated
### Title: Calculates the loglikelihoods of the saturated model
### Aliases: loglikssaturated

### ** Examples

library(MPDiR) # contains the Vernier data
fit <- quickpsy(Vernier, Phaseshift, NumUpward, N,
                grouping = .(Direction, WaveForm, TempFreq), B = 20)
loglikssaturated(fit)



