library(quickpsy)


### Name: plotthresholds
### Title: Plot the thresholds
### Aliases: plotthresholds

### ** Examples

library(MPDiR) # contains the Vernier data
fit <- quickpsy(Vernier, Phaseshift, NumUpward, N,
                grouping = .(Direction, WaveForm, TempFreq), B = 10)
plotthresholds(fit)
plotthresholds(fit, x = WaveForm)
plotthresholds(fit, xpanel = Direction)
plotthresholds(fit, color = Direction, ypanel = WaveForm, geom = 'point')



