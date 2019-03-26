library(quickpsy)


### Name: ypred
### Title: Predicted probabilities
### Aliases: ypred

### ** Examples

library(MPDiR) # contains the Vernier data
data(Vernier) # ?Venier for the reference
fit <- quickpsy(Vernier, Phaseshift, NumUpward, N,
                grouping = .(Direction, WaveForm, TempFreq), B = 20)
ypred(fit)



