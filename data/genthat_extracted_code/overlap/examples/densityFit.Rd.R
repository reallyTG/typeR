library(overlap)


### Name: densityFit
### Title: Fits von Mises kernel density to time-of-day data.
### Aliases: densityFit

### ** Examples

# Get example data:
data(simulatedData)

densityFit(tigerObs, c(0, pi/2, pi, 3*pi/2, 2*pi), 50)
# Densities at 6am and 6pm are fairly high, at midnight and midday, tiny.
# A crepuscular species!



