library(quickpsy)


### Name: plotthresholds_
### Title: Plot the thresholds
### Aliases: plotthresholds_

### ** Examples

library(MPDiR) # contains the Vernier data
fit <- quickpsy(Vernier, Phaseshift, NumUpward, N,
                grouping = .(Direction, WaveForm, TempFreq), B = 10)

plotthresholds_(fit, x = 'WaveForm')
plotthresholds_(fit, xpanel = 'Direction')
plotthresholds_(fit, color = 'Direction')
plotthresholds_(fit, color = 'Direction', ypanel = 'WaveForm', geom = 'point')



