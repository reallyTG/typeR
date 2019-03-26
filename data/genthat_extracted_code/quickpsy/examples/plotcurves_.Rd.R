library(quickpsy)


### Name: plotcurves_
### Title: Plot the curves
### Aliases: plotcurves_

### ** Examples

library(MPDiR) # contains the Vernier data
data(Vernier) # ?Venier for the reference
fit <- quickpsy(Vernier, Phaseshift, NumUpward, N,
                grouping = .(Direction, WaveForm, TempFreq), B = 5)

plotcurves_(fit, xpanel = 'Direction')
plotcurves_(fit, color = 'Direction')
plotcurves_(fit, xpanel = 'Direction', color = 'WaveForm', ci = FALSE)



