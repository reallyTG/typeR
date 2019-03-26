library(quickpsy)


### Name: plotpar
### Title: Plot the values of the parameters
### Aliases: plotpar

### ** Examples

library(MPDiR) # contains the Vernier data
fit <- quickpsy(Vernier, Phaseshift, NumUpward, N,
                grouping = .(Direction, WaveForm, TempFreq), B = 10)
plotpar(fit)
plotpar(fit, x = WaveForm)
plotpar(fit, xpanel = Direction)
plotpar(fit, color = Direction)
plotpar(fit, color = Direction, ypanel = WaveForm, geom = 'point')



