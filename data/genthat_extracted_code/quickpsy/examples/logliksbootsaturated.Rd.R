library(quickpsy)


### Name: logliksbootsaturated
### Title: Calculates the bootstrap loglikelihoods for the saturated model
### Aliases: logliksbootsaturated

### ** Examples

library(MPDiR) # contains the Vernier data
fit <- quickpsy(Vernier, Phaseshift, NumUpward, N,
                grouping = .(Direction, WaveForm, TempFreq), B = 20)
logliksbootsaturated(fit)



